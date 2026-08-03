import express from "express";
import db from "../server.js";

const router = express.Router();

// 1. ენდპოინტი: მხოლოდ მთავარი კატეგორიები
router.get("/main-categories", async (req, res) => {
  const lang = req.query.lang || "en";
  try {
    const [rows] = await db.query(
      `SELECT c.id, c.slug, ct.title AS name
       FROM categories c
       LEFT JOIN category_translations ct 
         ON c.id = ct.category_id AND ct.lang = ?
       WHERE c.parent_id IS NULL`,
      [lang],
    );

    const formatted = rows.map((c) => ({
      id: c.id,
      name: c.name || "Name not found",
      slug: c.slug,
    }));

    res.json(formatted);
  } catch (error) {
    console.error("❌ SQL Error main-categories-ში:", error);
    res.status(500).json({ error: error.message });
  }
});

// 2. ენდპოინტი: ყველა ქვეკატეგორია მშობლებთან ერთად
router.get("/all-subcategories", async (req, res) => {
  const lang = req.query.lang || "en";
  try {
    const [rows] = await db.query(
      `SELECT 
         child.id AS sub_id,
         child.slug AS sub_slug,
         child_ct.title AS sub_name,
         parent.slug AS parent_slug,
         parent_ct.title AS parent_name
       FROM categories child
       INNER JOIN categories parent 
         ON child.parent_id = parent.id
       LEFT JOIN category_translations child_ct 
         ON child.id = child_ct.category_id AND child_ct.lang = ?
       LEFT JOIN category_translations parent_ct 
         ON parent.id = parent_ct.category_id AND parent_ct.lang = ?
       WHERE child.parent_id IS NOT NULL`,
      [lang, lang],
    );

    const formatted = rows.map((row) => ({
      parent_slug: row.parent_slug,
      parent_name: row.parent_name || "Name not found",
      sub_id: row.sub_id,
      sub_name: row.sub_name || "Translation missing",
      sub_slug: row.sub_slug,
    }));

    res.json(formatted);
  } catch (error) {
    console.error("შეცდომა all-subcategories-ში:", error);
    res.status(500).json({ message: "Failed to fetch data" });
  }
});

// 3. ენდპოინტი: ერთი კონკრეტული კატეგორია სლაგით
router.get("/single/:slug", async (req, res) => {
  const { slug } = req.params;
  const lang = req.query.lang || "en";

  try {
    // 1. ვპოულობთ მთავარ კატეგორიას
    const [categories] = await db.query(
      `SELECT c.id, c.slug, c.image, ct.title AS name
       FROM categories c
       LEFT JOIN category_translations ct 
         ON c.id = ct.category_id AND ct.lang = ?
       WHERE c.slug = ?`,
      [lang, slug],
    );

    const category = categories[0];

    if (!category) {
      return res.status(404).json({ message: "კატეგორია ვერ მოიძებნა" });
    }

    // 2. ვპოულობთ მის ქვეკატეგორიებს (children/other_categories)
    const [subcategories] = await db.query(
      `SELECT c.id, c.slug, ct.title AS name
       FROM categories c
       LEFT JOIN category_translations ct 
         ON c.id = ct.category_id AND ct.lang = ?
       WHERE c.parent_id = ?`,
      [lang, category.id],
    );

    const formattedCategory = {
      id: category.id,
      name: category.name || "Name not found",
      slug: category.slug,
      image: category.image,
      subcategories: subcategories.map((child) => ({
        id: child.id,
        name: child.name || "Translation missing",
        slug: child.slug,
      })),
    };

    console.log(
      `React-ში გასაგზავნი მზა ობიექტი (${lang} ენაზე):`,
      formattedCategory,
    );
    res.json(formattedCategory);
  } catch (error) {
    console.error("ბექენდის შეცდომა:", error);
    res.status(500).json({ error: error.message });
  }
});

// 4 ენდპოინტი:  ვპოულობთ მხოლოდ მთავარი კატეგორიის სლაგებს

router.get("/main-categories-slugs", async (req, res) => {
  try {
    const [rows] = await db.query(
      `SELECT DISTINCT 
    c.slug AS level1_slug
FROM categories c
LEFT JOIN categories c2 
    ON c2.parent_id = c.id 
WHERE c.parent_id IS NULL;`,
    );

    const slugs = rows.map((row) => row.level1_slug);
    res.json(slugs);
  } catch (error) {
    console.error("Error fetching main-categories-slugs", error);
    res.status(500).json({ message: "Failed to fetch data" });
  }
});

// 5 ენდპოინტი: ვპოულობთ ქვე კატეგორიების სლაგებს

router.get("/sub_categories_slug/:slug", async (req, res) => {
  try {
    const { slug } = req.params;

    const [rows] = await db.query(
      `SELECT DISTINCT c2.slug as subCat_slug
       FROM categories c
       LEFT JOIN categories c2 ON c2.parent_id = c.id 
       WHERE c.parent_id IS null
       and c.slug = ?`,
      [slug],
    );

    const slugs = rows.map((row) => row.subCat_slug);
    res.json(slugs);
  } catch (error) {
    console.error("Error fetching main-categories-slugs", error);
    res.status(500).json({ message: "Failed to fetch data" });
  }
});

// 6 ენდპოინტი: ვპოულობს კონკრეტული ქვეკატეგორიის სახელებს სხვა მონაცემებს

router.get("/s/:slug", async (req, res) => {
  try {
    const { slug } = req.params;
    const lang = req.query.lang || "en";

    const [products] = await db.query(
      `SELECT 
  p.name AS name,
  p.slug AS slug,
  p.image AS image,
  p.price AS price,
  p.discount_price AS discounPrice,
  ct.title AS subCategory,
  pct.title AS parentCategor
FROM categories c 
INNER JOIN products p 
  ON c.id = p.category_id 
INNER JOIN category_translations ct   
  ON p.category_id = ct.category_id AND ct.lang = ?
LEFT JOIN categories parent 
  ON c.parent_id = parent.id
LEFT JOIN category_translations pct 
  ON parent.id = pct.category_id AND pct.lang = ?
WHERE c.slug = ?`,
      [lang, lang, slug],
    );

    res.json(products);
  } catch (error) {
    console.error("Error fetching main-categories-slugs", error);
    res.status(500).json({ message: "Failed to fetch data" });
  }
});

// 7. ენტპოინტი.
router.get("/screen_attribute/:slug", async (req, res) => {
  try {
    const { slug } = req.params;
    const lang = req.query.lang || "en";

    // 1. მონაცემების წამოღება მონაცემთა ბაზიდან
    const [rows] = await db.query(
      `SELECT DISTINCT 
            c.slug AS slug,
            t.name AS attribute_name,
            pavt.value AS attribute_value,
            asg.position
       FROM attribute_screen_groups asg
       JOIN categories c ON asg.categories_id = c.id 
       JOIN attributes a ON asg.attribute_id = a.id 
       JOIN attribute_translations t ON a.id = t.attribute_id 
       JOIN product_attribute_values pav ON a.id = pav.attribute_id
       JOIN products p ON pav.product_id = p.id AND p.category_id  = c.id
       JOIN product_attribute_values_translations pavt ON pav.id = pavt.product_attribute_value_id 
         WHERE t.locale = ?
         AND pavt.lang = ?
         AND c.slug = ?
         ORDER BY asg.position IS NULL ASC, asg.position ASC;
`,
      [lang, lang, slug],
    );

    // 2. წამოღებული მონაცემების დაჯგუფება reduce-ის გამოყენებით
    const groupedFilters = rows.reduce((acc, row) => {
      const { attribute_name, attribute_value } = row;

      // თუ ეს ატრიბუტი ჯერ არ გვქონია, შევქმნათ ცარიელი მასივი აკუმულატორში
      if (!acc[attribute_name]) {
        acc[attribute_name] = [];
      }

      // დავამატოთ მნიშვნელობა, თუ ის არსებობს და ჯერ არ არის მასივში
      if (attribute_value && !acc[attribute_name].includes(attribute_value)) {
        acc[attribute_name].push(attribute_value);
      }

      return acc;
    }, {});

    // 3. სტრუქტურირებული პასუხის დაბრუნება კლიენტთან
    res.json({
      category: slug,
      filters: groupedFilters,
    });
  } catch (error) {
    console.error("Error fetching screen attributes:", error);
    res.status(500).json({
      success: false,
      message: "Failed to fetch screen attributes",
    });
  }
});

// ენდპოინტი Admin Panel-ისთვის: ატრიბუტები კატეგორიის ID-ის მიხედვით
router.get("/category-attributes/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const lang = req.query.lang || "en";

    const [attributes] = await db.query(
      `SELECT 
         a.id AS attribute_id,
         t.name AS attribute_name
       FROM attribute_screen_groups asg
       JOIN attributes a ON asg.attribute_id = a.id
       JOIN attribute_translations t ON a.id = t.attribute_id
       WHERE asg.categories_id = ? AND t.locale = ?`,
      [id, lang],
    );

    res.json(attributes);
  } catch (error) {
    console.error("❌ Error fetching category-attributes:", error);
    res.status(500).json({ message: "Failed to fetch attributes" });
  }
});

//  ენდპოინტი Admin Panel-ისთვის: ახალი პროდუქტის შექმნა
router.post("/add-product", async (req, res) => {
  try {
    const {
      name,
      slug,
      category_id,
      brand_id,
      price,
      discount_price,
      image,
      description,
      stock,
      attributes,
    } = req.body;

    // 1. ჩავწერთ პროდუქტს `products` ცხრილში შენი სვეტების მიხედვით
    const [productResult] = await db.query(
      `INSERT INTO products (
        name, 
        slug, 
        category_id, 
        brand_id, 
        price, 
        discount_price, 
        image, 
        description, 
        stock
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        name,
        slug ||
          name
            .toLowerCase()
            .replace(/\s+/g, "-")
            .replace(/[^\w-]+/g, ""), // უსაფრთხო slug
        category_id,
        brand_id || null,
        price,
        discount_price || null,
        image || null,
        description || null,
        stock || 0,
      ],
    );

    // 2. ამოვიღებთ ახლად შექმნილი პროდუქტის ID-ს
    const newProductId = productResult.insertId;

    // 3. თუ პროდუქტს მოჰყვება ატრიბუტები, ჩავწერთ `product_attribute_values`-ში
    if (attributes && attributes.length > 0) {
      const attributeRows = attributes.map((attr) => [
        newProductId,
        attr.attribute_id,
        attr.value,
      ]);

      await db.query(
        `INSERT INTO product_attribute_values (product_id, attribute_id, value) 
         VALUES ?`,
        [attributeRows],
      );
    }

    res.status(201).json({
      success: true,
      message: "პროდუქტი წარმატებით დაემატა! 🎉",
      productId: newProductId,
    });
  } catch (error) {
    console.error("❌ Error adding product:", error);
    res.status(500).json({ error: error.message });
  }
});

export default router;
