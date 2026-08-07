import { GoogleGenAI } from '@google/genai';
import './config/firebaseAdmin.js';

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

BigInt.prototype.toJSON = function () {
  return this.toString();
};

import express from 'express';
import cors from 'cors';
import mysql from 'mysql2/promise';
import 'dotenv/config';
import categoryRouter from './routes/categories.js';
import authRouter from './register.js';
import signIn from './signIn.js';
import googleAuth from './routes/googleAuth.js';
import emailVarification from './email-verification/emailVerification.js';
import compareAPI from './compare/compare.js';
import productsRouter from './routes/products.js';

const app = express();

// 1. MySQL კავშირი პირდაპირ server.js-ში
const db = mysql.createPool({
  host: '127.0.0.1',
  port: 3306,
  user: 'root',
  password: '',
  database: 'react_projet_tech_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// ექსპორტი, რომ categories.js-მაც შეძლოს ბაზასთან წვდომა
export default db;

// Middleware
app.use(cors());
app.use(express.json());

// სურათების static საქაღალდე
app.use('/uploads', express.static('images'));

// 2. პროდუქტების წამოღება პირდაპირი SQL მოთხოვნით
app.get('/api/products', async (req, res) => {
  try {
    const [products] = await db.query('SELECT * FROM products');
    res.json(products);
  } catch (error) {
    console.error('შეცდომა პროდუქტების წამოღებისას:', error);
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/products/filter', async (req, res) => {
  console.log('👉 მოთხოვნა შემოვიდა ბექენდში! Body:', req.body);
  try {
    const { category, filters, lang = 'en' } = req.body;

    // 1. საბაზო Query კატეგორიისა და აქტიური პროდუქტებისთვის
    let sql = `
      SELECT p.* 
      FROM products p
      JOIN categories c ON p.category_id = c.id
      WHERE c.slug = ? AND p.is_active = 1
    `;
    const queryParams = [category];

    // 2. დინამიური ფილტრების დამატება Subquery-ების მეშვეობით
    if (filters && Object.keys(filters).length > 0) {
      for (const [attrName, values] of Object.entries(filters)) {
        // ვამოწმებთ, რომ მასივი ცარიელი არ იყოს
        if (Array.isArray(values) && values.length > 0) {
          const placeholders = values.map(() => '?').join(',');

          // თითოეული მონიშნული ატრიბუტის ჯგუფისთვის (მაგ: Brand, Memory) ვამატებთ AND p.id IN (...)
          sql += `
            AND p.id IN (
              SELECT pav.product_id
              FROM product_attribute_values pav
              JOIN attribute_translations at ON pav.attribute_id = at.attribute_id
              JOIN product_attribute_values_translations pavt ON pav.id = pavt.product_attribute_value_id
              WHERE at.name = ? 
                AND at.locale = ? 
                AND pavt.value IN (${placeholders}) 
                AND pavt.lang = ?
            )
          `;

          // SQL ? ნიშნების შესაბამისი პარამეტრების ჩასმა თანმიმდევრობით
          queryParams.push(attrName, lang, ...values, lang);
        }
      }
    }

    // შედეგის სორტირება თარიღით (ახლები თავში)
    sql += ` ORDER BY p.created_at DESC;`;

    // 3. ბაზაში მოთხოვნის გაშვება
    const [products] = await db.query(sql, queryParams);

    // გაფილტრული პროდუქტების დაბრუნება ფრონტზე
    res.json(products);
  } catch (error) {
    console.error('შეცდომა პროდუქტების ფილტრაციისას:', error);
    res.status(500).json({ error: 'სერვერის შეცდომა' });
  }
});

// AI ტექსტიდან SQL-ის გენერაციის ენდპოინტი
app.post('/api/ai-query', async (req, res) => {
  console.log('👉 AI მოთხოვნა შემოსულია! კითხვა:', req.body.userQuestion);
  try {
    const { userQuestion } = req.body;

    if (!userQuestion) {
      return res.status(400).json({ error: 'კითხვა არ არის მითითებული' });
    }

    // ვუწერთ ინსტრუქციას და ვაწვდით ბაზის სქემას
    const prompt = `
      შენ ხარ პროფესიონალი SQL ექსპერტი. მე მაქვს MySQL ბაზა შემდეგი ზუსტი სქემით:
      - categories (id, name, slug)
      - products (id, category_id, name, price, discount_price, is_active, created_at)
      - product_attribute_values (id, product_id, attribute_id)
      - attribute_translations (id, attribute_id, name, locale)
      - product_attribute_values_translations (id, product_attribute_value_id, value, lang)

      მომხმარებლის კითხვის საფუძველზე დაწერე მხოლოდ და მხოლოდ გამართული SQL მოთხოვნა MySQL-ისთვის.
      არ დაწერო არანაირი ახსნა-განმარტება ან ტექსტი. დააბრუნე მხოლოდ სუფთა SQL კოდი, რომელიც იწყება SELECT-ით.
      
      კითხვა: "${userQuestion}"
    `;

    // ვუგზავნით მოთხოვნას Gemini-ს (გამოვიყენოთ gemini-2.5-flash მოდელი)
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: prompt
    });

    let sqlQuery = response.text.trim();

    // ვწმენდთ კოდს Markdown სიმბოლოებისგან (თუ AI-მ ```sql ... ``` ფორმატით დააბრუნა)
    sqlQuery = sqlQuery
      .replace(/```sql/g, '')
      .replace(/```/g, '')
      .trim();

    console.log('🤖 Gemini-ს გენერირებული SQL:', sqlQuery);

    // უსაფრთხოების შემოწმება: მხოლოდ SELECT მოთხოვნების გაშვება შეიძლება!
    if (!sqlQuery.toLowerCase().startsWith('select')) {
      return res.status(400).json({ error: 'AI-მ სცადა არაუსაფრთხო მოთხოვნის შესრულება.' });
    }

    // ვუშვებთ გენერირებულ SQL-ს ჩვენს MySQL ბაზაში
    const [rows] = await db.query(sqlQuery);

    // ვუბრუნებთ შედეგს ფრონტენდს
    res.json({
      sql: sqlQuery,
      result: rows
    });
  } catch (error) {
    console.error('AI Query Error:', error);
    res.status(500).json({ error: 'სერვერის შეცდომა AI-ს დამუშავებისას' });
  }
});

// 4. პროდუქტების ძებნის ენდპოინტი
app.get('/api/search', async (req, res) => {
  try {
    const { q, lang = 'en' } = req.query;

    if (!q || q.trim().length === 0) {
      return res.json([]);
    }

    const searchTerm = `%${q.trim()}%`;

    // ძებნა პროდუქტების სახელში და აღწერაში
    const [products] = await db.query(
      `SELECT 
        p.id,
        p.name,
        p.slug,
        p.price,
        p.discount_price,
        p.image,
        p.is_active,
        c.slug as category_slug,
        ct.title as category_name
      FROM products p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN category_translations ct ON c.id = ct.category_id AND ct.lang = ?
      WHERE p.is_active = 1
        AND (p.name LIKE ? OR p.description LIKE ? OR p.short_description LIKE ?)
      ORDER BY p.created_at DESC
      LIMIT 200`,
      [lang, searchTerm, searchTerm, searchTerm]
    );

    res.json(products);
  } catch (error) {
    console.error('შეცდომა ძებნისას:', error);
    res.status(500).json({ error: error.message });
  }
});

app.use('/api/categories', categoryRouter);
app.use('/api/register', authRouter);
app.use('/api/signIn', signIn);
app.use('/api/auth', googleAuth);
app.use('/api/verification', emailVarification);
app.use('/api/compare', compareAPI);
app.use('/api/products', productsRouter);

const PORT = 5001;
app.listen(PORT, () => console.log(`🚀 Server is running on port ${PORT}`));
