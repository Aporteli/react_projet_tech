import express from 'express';
import db from '../server.js';

const router = express.Router();

router.get('/search', async (req, res) => {
  try {
    const { q, lang, category } = req.query;

    if (!q || q.trim().length === 0) {
      return res.json([]);
    }

    const searchTerm = `%${q.trim()}%`;
    const categoryId = category ? category : null;

    const sql = `
      SELECT 
        p.id AS product_id,
        p.name AS product_name,
        p.slug AS product_slug,
        p.price,
        p.discount_price,
        p.image,
        c.id AS category_id,
        c.slug AS category_slug,
        CONCAT(
          '[',
          GROUP_CONCAT(
            JSON_OBJECT(
              'attribute_id', a.id,
              'attribute_name', COALESCE(at.name, 'N/A'),
              'attribute_value', COALESCE(pavt.value, 'N/A')
            )
          ),
          ']'
        ) AS attributes
      FROM products p
      JOIN categories c 
        ON p.category_id = c.id
      JOIN product_attribute_values pav 
        ON p.id = pav.product_id
      JOIN attributes a 
        ON pav.attribute_id = a.id
      LEFT JOIN attribute_translations at 
        ON a.id = at.attribute_id AND at.locale = ?
      LEFT JOIN product_attribute_values_translations pavt 
        ON pav.id = pavt.product_attribute_value_id AND pavt.lang = ?
      WHERE (? IS NULL OR p.category_id = ?)
        AND p.is_active = 1
        AND (
          p.name LIKE ? 
          OR p.description LIKE ? 
          OR p.short_description LIKE ?
        )
      GROUP BY p.id
      ORDER BY a.id
      LIMIT 300
    `;

    const params = [lang, lang, categoryId, categoryId, searchTerm, searchTerm, searchTerm];

    const [products] = await db.query(sql, params);

    // JSON ტექსტად დაბრუნებული attributes ველის მასივად გარდაქმნა
    const formattedProducts = products.map(product => ({
      ...product,
      attributes: product.attributes ? JSON.parse(product.attributes) : []
    }));

    res.json(formattedProducts);
  } catch (error) {
    console.error('შეცდომა ძებნისას:', error);
    res.status(500).json({ error: error.message });
  }
});

router.get('/screen_attribute', async (req, res) => {
  try {
    const { category } = req.query;

    if (!category) {
      return res.status(400).json({
        success: false,
        message: 'Category parameter is required.'
      });
    }

    const lang = req.query.lang || 'en';

    const [rows] = await db.query(
      `SELECT DISTINCT 
          at.name AS attribute_name
       FROM products p
       JOIN product_attribute_values pav 
          ON p.id = pav.product_id
       JOIN attributes a 
          ON pav.attribute_id = a.id
       JOIN attribute_translations at 
          ON a.id = at.attribute_id
       WHERE p.category_id = ?
         AND p.is_active = 1
         AND at.locale = ?
       ORDER BY at.id`,
      [category, lang]
    );

    const attributeNames = rows.map(row => row.attribute_name);

    res.json({
      success: true,
      category_id: category,
      attributes: attributeNames
    });
  } catch (error) {
    console.error('Error fetching category attribute names:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch attribute names',
      error: error.message
    });
  }
});

router.get('/products', async (req, res) => {
  try {
    const { ids, lang } = req.query;

    if (!ids || ids.trim().length === 0) {
      return res.json([]);
    }

    const productIds = ids
      .split(',')
      .map(id => id.trim())
      .filter(Boolean);
    const currentLang = lang || 'en';

    if (productIds.length === 0) {
      return res.json([]);
    }

    const placeholders = productIds.map(() => '?').join(',');

    const sql = `
      SELECT 
        p.id AS product_id,
        p.name AS product_name,
        p.slug AS product_slug,
        p.price,
        p.discount_price,
        p.image,
        c.id AS category_id,
        c.slug AS category_slug,
        CONCAT(
          '[',
          GROUP_CONCAT(
            JSON_OBJECT(
              'attribute_id', a.id,
              'attribute_name', COALESCE(at.name, 'N/A'),
              'attribute_value', COALESCE(pavt.value, 'N/A')
            )
          ),
          ']'
        ) AS attributes
      FROM products p
      JOIN categories c 
        ON p.category_id = c.id
      JOIN product_attribute_values pav 
        ON p.id = pav.product_id
      JOIN attributes a 
        ON pav.attribute_id = a.id
      LEFT JOIN attribute_translations at 
        ON a.id = at.attribute_id AND at.locale = ?
      LEFT JOIN product_attribute_values_translations pavt 
        ON pav.id = pavt.product_attribute_value_id AND pavt.lang = ?
      WHERE p.id IN (${placeholders})
        AND p.is_active = 1
      GROUP BY p.id
      ORDER BY a.id
    `;

    const params = [currentLang, currentLang, ...productIds];

    const [products] = await db.query(sql, params);

    const formattedProducts = products.map(product => ({
      ...product,
      attributes: product.attributes ? JSON.parse(product.attributes) : []
    }));

    res.json(formattedProducts);
  } catch (error) {
    console.error('Error fetching products by IDs:', error);
    res.status(500).json({ error: error.message });
  }
});

export default router;
