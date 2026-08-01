import styles from "./cartIconTooltip.module.css";
import emptyCartImage from "../../assets/pictures/cartToolTipPhoto.webp";
import { useTranslation } from "react-i18next";

export const CartIconTooltip = () => {
  const { t } = useTranslation();
  return (
    <>
      <div className={styles.hiddenDiv}></div>
      <div className={styles.tooltip}>
        <p className={styles.title}>{t("tooltip.cart.title")}</p>
        <p className={styles.description}>
          {t("tooltip.cart.subtitle")}
        </p>
        <img
          className={styles.emptyCartImage}
          src={emptyCartImage}
          alt="Empty cart"
        />
        <button className={styles.continueShoppingButton}>
          {t("tooltip.cart.button")}
        </button>
      </div>
    </>
  );
};
