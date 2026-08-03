import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import styles from "./categoryPage.module.css";
import { IoIosArrowUp } from "react-icons/io";
import { useTranslation } from "react-i18next";
import { Link } from "react-router-dom";

function CategoryPage() {
  const { slug } = useParams(); // URL-იდან ვიღებთ სლაგს (მაგ: mobile-phones-and-accessories)
  const [openCategoryBox, setOpenCategoryBox] = useState(false);
  const [windowWidth, setWindowWidth] = useState(window.innerWidth);

  const [categoryInfo, setCategoryInfo] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const { t, i18n } = useTranslation();
  console.log(i18n.language);
  const subcategories = categoryInfo?.subcategories || [];
  const subNames = subcategories.map((sub) => sub.name);
  console.log("subNames:", subNames);

  const categoryImageLinks =
    typeof categoryInfo?.image === "string"
      ? JSON.parse(categoryInfo.image)
      : categoryInfo?.image || [];
  console.log("categoryImageLinks:", categoryImageLinks);

  useEffect(() => {
    const handleResize = () => {
      setWindowWidth(window.innerWidth);
    };

    window.addEventListener("resize", handleResize);

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  useEffect(() => {
    setLoading(true);
    fetch(
      `http://localhost:5001/api/categories/single/${slug}?lang=${i18n.language}`,
    )
      .then((res) => {
        if (!res.ok) throw new Error("კატეგორია ვერ მოიძებნა");
        return res.json();
      })
      .then((data) => {
        setCategoryInfo(data); 
        setLoading(false);
        console.log("ბექენდიდან მოსული მონაცემები:", data);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, [slug, i18n.language]); 

  console.log(categoryInfo, "categoryInfo");

  if (loading) return <div>იტვირთება კატეგორიის მონაცემები...</div>;
  if (error) return <div>შეცდომა: {error}</div>;

  return (
    <div className={styles.categoryContainer}>
      <div className={styles.mainCategoryTitleContainer}>
        <h1
          className={`${styles.mainCategoryTitle} ${windowWidth < 900 ? styles.mainCategoryTitleActive : ""}`}
        >
          {categoryInfo?.name}
        </h1>
        <div
          className={`${styles.categorySubcategories} ${windowWidth > 900 ? styles.categorySubcategoriesHidden : styles.active} ${openCategoryBox ? styles.subCategoriesbackGround : ""}`}
        >
          <div className={styles.categorySubcategoryHeader}>
            <h4 className={styles.categorySubcategoryTitle}>
              {categoryInfo?.name}
            </h4>
            <div
              className={`${styles.categorySubcategoryIcon} ${
                openCategoryBox ? styles.categorySubcategoryIconActive : ""
              }`}
              onClick={() => setOpenCategoryBox(!openCategoryBox)}
            >
              <IoIosArrowUp />
            </div>
          </div>
          <div
            className={`${styles.categorySubcategoryList} ${
              openCategoryBox ? styles.categorySubcategoryListActive : ""
            }`}
          >
            {subNames.map((sub, index) => (
              <p key={index}>{sub}</p>
            ))}
          </div>
        </div>
      </div>

      <div className={styles.categoryContent}>
        <div className={styles.categoryTitle}>{t("categoryPage.title")}</div>
        <div className={styles.categoryName}>{categoryInfo?.name}</div>
        <div className={styles.categorySubcategories}>
          <div className={styles.categorySubcategoryHeader}>
            <h4 className={styles.categorySubcategoryTitle}>
              {categoryInfo?.name}
            </h4>
            <div
              className={`${styles.categorySubcategoryIcon} ${
                openCategoryBox ? styles.categorySubcategoryIconActive : ""
              }`}
              onClick={() => setOpenCategoryBox(!openCategoryBox)}
            >
              <IoIosArrowUp />
            </div>
          </div>
          <div
            className={`${styles.categorySubcategoryList} ${
              openCategoryBox ? styles.categorySubcategoryListActive : ""
            }`}
          >
            {subNames.map((sub, index) => (
              <p key={index}>{sub}</p>
            ))}
          </div>
        </div>

        <div className={styles.categoryImages}>
          {subcategories.map((subCat, index) => (
            <div key={index} className={styles.categoryImageContainer}>
              <div className={styles.categorySubcategoriesImagesTitle}>
                <p className={styles.categoryImageTitle}>{subCat.name}</p>
              </div>
              {categoryImageLinks[index] && (
                <Link to={`/s/${subCat.slug}`}>
                  <div className={styles.categoryImageWrapper}>
                    <img
                      className={styles.categoryImage}
                      src={`http://localhost:5001/uploads/${categoryImageLinks[index]}`}
                      alt={subCat.name}
                    />
                  </div>
                </Link>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default CategoryPage;
