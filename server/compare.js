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

    // ძებნა პროდუქტების სახელში და აღწერაში
    let sql = `SELECT 
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
      JOIN categories c ON p.category_id = c.id
      LEFT JOIN category_translations ct ON c.id = ct.category_id AND ct.lang = ?
      WHERE p.is_active = 1`;

    const params = [lang];

    if (category) {
      sql += ` AND p.category_id = ?`;
      params.push(category);
    }

    sql += ` AND (p.name LIKE ? OR p.description LIKE ? OR p.short_description LIKE ?)
      ORDER BY p.created_at DESC
      LIMIT 200`;

    params.push(searchTerm, searchTerm, searchTerm);

    const [products] = await db.query(sql, params);

    res.json(products);
  } catch (error) {
    console.error('შეცდომა ძებნისას:', error);
    res.status(500).json({ error: error.message });
  }
});

export default router;
