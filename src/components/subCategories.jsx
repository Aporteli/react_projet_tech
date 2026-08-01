import styles from "./subCategories.module.css";
import { Link } from "react-router-dom";
import { useTranslation } from "react-i18next";
import {
  fetchMainCategorySlugs,
  fetchsubCategorySlugs,
} from "../api/categoryService";
import { useEffect, useState } from "react";

export default function SubCategories({ activeCategory }) {
  const { t } = useTranslation();
  const [mainSlugs, setMainSlugs] = useState([]);
  const [subSlugs, setSubSlugs] = useState([]);

  useEffect(() => {
    fetchMainCategorySlugs()
      .then((data) => setMainSlugs(data))
      .catch((err) => console.error(err));
  }, []);

  useEffect(() => {
    const currentSlug = mainSlugs[activeCategory];
    if (currentSlug) {
      fetchsubCategorySlugs(currentSlug)
        .then((data) => setSubSlugs(data))
        .catch((err) => console.error(err));
    }
  }, [mainSlugs, activeCategory]);


  const categories = t("categories", { returnObjects: true }) || {};

  const mainKeys = Object.keys(categories);
  const activeKey = mainKeys[activeCategory];

  // უსაფრთხოების ხაზი: თუ ბაზაში ეს კატეგორია ჯერ არ არსებობს
  if (!activeKey || !categories[activeKey]) {
    return (
      <div className={styles.megaMenuContainer}>
        <p>{t("subcategories.soon")}</p>
      </div>
    );
  }

  const activeSubKeys = Object.keys(categories[activeKey]);

  return (
    <div className={styles.megaMenuContainer}>
      {activeSubKeys.map((subKey, index) => {
        const products = categories[activeKey][subKey];
        const subSlug = subSlugs[index];
        return (
          <div key={subKey} className={styles.subCategoryBlock}>
            <Link
              className={styles.subCategoryLink}
              to={`/s/${subSlug}`}
            >
              <h3 className={styles.subCategoryTitle}>{subKey}</h3>
            </Link>
            {Array.isArray(products) && products.length > 0 ? (
              <ul className={styles.subCategoryList}>
                {products.map((product) => (
                  <li className={styles.subCategoryItem} key={product}>
                    {product}
                  </li>
                ))}
              </ul>
            ) : null}
          </div>
        );
      })}
    </div>
  );
}
