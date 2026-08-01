import styles from "./wishlistTooltip.module.css";
import emptyCartImage from "../../assets/pictures/wishlistToolTipPhoto.webp";
import { useTranslation } from "react-i18next";

export const WishlistTooltip = () => {
  const { t } = useTranslation();
  return (
    <>
      <div className={styles.hiddenDiv}></div>
      <div className={styles.tooltip}>
        <p className={styles.title}>{t("tooltip.wishlist.title")}</p>
        <p className={styles.description}>
          {t("tooltip.wishlist.subtitle")}
        </p>
        <img
          className={styles.emptyCartImage}
          src={emptyCartImage}
          alt="Empty cart"
        />
        <button className={styles.continueShoppingButton}>
          {t("tooltip.wishlist.button")}
        </button>
      </div>
    </>
  );
};
