import styles from "./wishlist.module.css";
import { useTranslation } from "react-i18next";

export default function Wishlist() {
  const { t } = useTranslation();

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>{t("wishlist.title") || "Wishlist"}</h1>
      </div>
      <div className={styles.content}>
        <div className={styles.emptyWishlist}>
          <p className={styles.emptyMessage}>
            {t("wishlist.empty") || "Your wishlist is empty"}
          </p>
        </div>
      </div>
    </div>
  );
}
