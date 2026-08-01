import styles from "./homeCategoriesSection.module.css";
import phoneIcon from "../../assets/categoriesIcons/phoneIcon.webp";
import tvIcon from "../../assets/categoriesIcons/tvIcon.webp";
import cameraIcon from "../../assets/categoriesIcons/cameraIcon.webp";
import computerIcon from "../../assets/categoriesIcons/computerIcon.webp";
import gamingIcon from "../../assets/categoriesIcons/gamingIcon.webp";
import homeAppliancesIcon from "../../assets/categoriesIcons/homeAppliancesIcon.webp";
import houseAndGardenIcon from "../../assets/categoriesIcons/houseAndGardenIcon.webp";
import ovenIcon from "../../assets/categoriesIcons/ovenIcon.webp";
import personalCareIcon from "../../assets/categoriesIcons/personalCareIcon.webp";
import smatrtHomeIcon from "../../assets/categoriesIcons/smartHomeIcon.webp";
import { useTranslation } from "react-i18next";

const categories = [
  { icon: phoneIcon, name:"" },
  { icon: tvIcon, name:"" },
  { icon: cameraIcon, name:"" },
  { icon: computerIcon, name:"" },
  { icon: gamingIcon, name:"" },
  { icon: homeAppliancesIcon, name:"" },
  { icon: houseAndGardenIcon, name:"" },
  { icon: ovenIcon, name: "" },
  { icon: personalCareIcon, name:"" },
  { icon: smatrtHomeIcon, name:"" },
];

export default function HomeCategoriesSection() {
  const { t } = useTranslation();

  const categoriesList = t("categoriesONhomePage.categoriesONhome", { returnObjects: true }) || {};
  const categoriesListArray = Object.values(categoriesList);
  const translatedCategories = categories.map((item, index) => ({
    ...item,
    name: categoriesListArray[index] || item.name, // თუ თარგმანი არ არის, დატოვებს საწყის სახელს
  }));

  return (
    <div className={styles.categoriesSection}>
      <h1 className={styles.categoriesTitle}>{t("categoriesONhomePage.categories.title")}</h1>
      <div className={styles.categories}>
        {translatedCategories.map((category, index) => (
          <div className={styles.categoryItem} key={index}>
            <p className={styles.categoryText}>{category.name}</p>
            <div className={styles.categoryIconContainer}>
              <img
                src={category.icon}
                alt={category.name}
                className={styles.categoryIcon}
              />
            </div>
            <div className={styles.categoryOverlay}></div>
          </div>
        ))}
      </div>
    </div>
  );
}
