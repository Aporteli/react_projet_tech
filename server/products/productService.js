import db from '../server.js';

export async function getProductById(productId, lang = 'en') {
  try {
    // Get product basic info with category
    const [products] = await db.query(
      `SELECT 
        p.*,
        c.slug as category_slug,
        c.id as category_id,
        ct.title as category_name
      FROM products p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN category_translations ct ON c.id = ct.category_id AND ct.lang = ?
      WHERE p.id = ? AND p.is_active = 1`,
      [lang, productId]
    );

    if (products.length === 0) {
      return null;
    }

    const product = products[0];

    // Get all attribute groups for this category
    const [attributeGroups] = await db.query(
      `SELECT 
        ag.id,
        ag.position,
        agt.name as group_name
      FROM attribute_groups ag
      LEFT JOIN attribute_group_translations agt ON ag.id = agt.attribute_group_id AND agt.locale = ?
      WHERE ag.id IN (
        SELECT DISTINCT attribute_group_id 
        FROM attributes 
        WHERE id IN (
          SELECT DISTINCT attribute_id 
          FROM product_attribute_values 
          WHERE product_id = ?
        )
      )
      ORDER BY ag.position`,
      [lang, productId]
    );

    // Get all attributes with their values for this product
    const [attributes] = await db.query(
      `SELECT 
        a.id as attribute_id,
        a.attribute_group_id,
        at.name as attribute_name,
        pav.id as product_attribute_value_id,
        pavt.value as attribute_value
      FROM product_attribute_values pav
      JOIN attributes a ON pav.attribute_id = a.id
      JOIN attribute_translations at ON a.id = at.attribute_id AND at.locale = ?
      LEFT JOIN product_attribute_values_translations pavt ON pav.id = pavt.product_attribute_value_id AND pavt.lang = ?
      WHERE pav.product_id = ?
      ORDER BY a.attribute_group_id, a.id`,
      [lang, lang, productId]
    );

    // Group attributes by attribute groups
    const attributeGroupsMap = {};
    attributeGroups.forEach(group => {
      attributeGroupsMap[group.id] = {
        id: group.id,
        name: group.group_name,
        position: group.position,
        attributes: []
      };
    });

    attributes.forEach(attr => {
      const groupId = attr.attribute_group_id;
      if (attributeGroupsMap[groupId]) {
        attributeGroupsMap[groupId].attributes.push({
          id: attr.attribute_id,
          name: attr.attribute_name,
          value: attr.attribute_value
        });
      } else {
        // Handle attributes without a group
        if (!attributeGroupsMap['ungrouped']) {
          attributeGroupsMap['ungrouped'] = {
            id: null,
            name: 'Other',
            position: 988,
            attributes: []
          };
        }
        attributeGroupsMap['ungrouped'].attributes.push({
          id: attr.attribute_id,
          name: attr.attribute_name,
          value: attr.attribute_value
        });
      }
    });

    // Convert to array and sort by position
    const groupedAttributes = Object.values(attributeGroupsMap)
      .filter(group => group.attributes.length > 0)
      .sort((a, b) => a.position - b.position);

    return {
      ...product,
      attributeGroups: groupedAttributes
    };
  } catch (error) {
    console.error('Error fetching product:', error);
    throw error;
  }
}
