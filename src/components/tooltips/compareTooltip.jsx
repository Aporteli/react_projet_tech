import styles from "./compareTooltip.module.css";
import emptyCartImage from "../../assets/pictures/compareToolTipPhoto.webp";
import { useTranslation } from "react-i18next";

export const CompareTooltip = () => {
  const { t } = useTranslation();
  return (
    <>
      <div className={styles.hiddenDiv}></div>
      <div className={styles.tooltip}>
        <p className={styles.title}>{t("tooltip.compare.title")}</p>
        <p className={styles.description}>
         {t("tooltip.compare.subtitle")}
        </p>
        <img
          className={styles.emptyCartImage}
          src={emptyCartImage}
          alt="Empty cart"
        />
        <button className={styles.continueShoppingButton}>
          {t("tooltip.compare.button")}
        </button>
      </div>
    </>
  );
};
