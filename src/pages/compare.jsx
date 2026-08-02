import styles from "./compare.module.css";
import { useTranslation } from "react-i18next";

export default function Compare() {
  const { t } = useTranslation();

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>{t("compare.title") || "Compare Products"}</h1>
      </div>
      <div className={styles.content}>
        <div className={styles.emptyCompare}>
          <p className={styles.emptyMessage}>
            {t("compare.empty") || "No products to compare"}
          </p>
        </div>
      </div>
    </div>
  );
}
