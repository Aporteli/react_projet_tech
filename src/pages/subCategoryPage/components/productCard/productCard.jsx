import HeartIconLight from "../../../../icons/heartIconLight";
import { ShoppingCart, RefreshCw } from "lucide-react";
import { Link } from "react-router-dom";
import styles from "./productCard.module.css";

const BASE_URL = "http://localhost:5001";

export default function ProductCard({ product, t }) {
  const currentP =
    Number(product.discountPrice) &&
    Number(product.discountPrice) < Number(product.price)
      ? Number(product.discountPrice)
      : Number(product.price);

  return (
    <div className={styles.flexDiv}>
      <Link className={styles.card}>
        <div className={styles.cardImageContainer}>
          <div className={styles.buttonsContainer}>
            <button
              className={styles.compareBtn}
              onClick={(e) => e.preventDefault()}
            >
              <RefreshCw size={18} />
            </button>
            <button className={styles.heartBtn}>
              <HeartIconLight />
            </button>
          </div>
          <img
            className={styles.cardImage}
            src={`${BASE_URL}/uploads/${product.image}`}
            alt={product.name}
            loading="lazy"
          />
        </div>
        <div className={styles.cardContent}>
          <h4 className={styles.productName}>{product.name}</h4>
          <div className={styles.priceSection}>
            <div className={styles.priceContainer}>
              <span className={styles.currentPrice}>{currentP} ₾</span>
              {product.discountPrice &&
                Number(product.discountPrice) < Number(product.price) && (
                  <span className={styles.oldPrice}>
                    {Number(product.price)} ₾
                  </span>
                )}
            </div>
          </div>
          <div className={styles.actionButtons}>
            <button
              className={styles.addToCartBtn}
              onClick={(e) => e.preventDefault()}
            >
              <ShoppingCart size={15} />
            </button>
            <button
              className={styles.buyNowBtn}
              onClick={(e) => e.preventDefault()}
            >
              {t("discountSlider.buyNow")}
            </button>
          </div>
        </div>
      </Link>
    </div>
  );
}
