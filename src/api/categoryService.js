import i18n from "../i18n";

const BASE_URL = "http://localhost:5001/api";

// Used in subCategories.jsx

export async function fetchMainCategorySlugs() {
  try {
    const response = await fetch(
      `${BASE_URL}/categories/main-categories-slugs`,
    );
    if (!response.ok)
      throw new Error("მთავარი კატეგორიების სლაგები ვერ მოიძებნა");
    return await response.json();
  } catch (error) {
    console.error("fetchMainCategorySlugs error:", error);
    throw error;
  }
}

// Used in subCategories.jsx

export async function fetchsubCategorySlugs(slug) {
  try {
    if (!slug) return [];
    const response = await fetch(
      `${BASE_URL}/categories/sub_categories_slug/${slug}`,
    );
    if (!response.ok) throw new Error("Cannot find sub category slug");
    return await response.json();
  } catch (error) {
    console.error("fetchsubCategorySlugs error:", error);
    throw error;
  }
}
// Used in subCategoryPage.jsx
export async function fetchSubCategories(slug,lang) {
  try {
    if (!slug) return [];
    const response = await fetch(
      `${BASE_URL}/categories/s/${slug}?lang=${lang}`,
    );
    if (!response.ok) throw new Error("Cannot find sub category slug");
    return await response.json();
  } catch (error) {
    console.error("fetchsubCategorySlugs error:", error);
    throw error;
  }
}

//Used in subCategoryPage.jsx
export async function fetchSubCateogryScreenAttributes(slug,lang) {
  try {
    if (!slug) return [];
    const response = await fetch(
      `${BASE_URL}/categories/screen_attribute/${slug}?lang=${lang}`,
    );
    if (!response.ok) throw new Error("Cannot find sub category slug");
    return await response.json();
  } catch (error) {
    console.error("fetchsubCategorySlugs error:", error);
    throw error;
  }
}

