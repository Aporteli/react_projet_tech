import express from 'express';
import { getProductById } from '../products/productService.js';

const router = express.Router();

// Get single product by ID with all attributes
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { lang = 'en' } = req.query;

    if (!id || isNaN(id)) {
      return res.status(400).json({ error: 'Invalid product ID' });
    }

    const product = await getProductById(parseInt(id), lang);

    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }

    res.json(product);
  } catch (error) {
    console.error('Error fetching product:', error);
    res.status(500).json({ error: 'Server error fetching product' });
  }
});

export default router;
