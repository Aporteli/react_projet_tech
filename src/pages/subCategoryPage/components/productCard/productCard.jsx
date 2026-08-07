import HeartIconLight from '../../../../icons/heartIconLight';
import HeartIconFilled from '../../../../icons/heartIconFilled';
import { ShoppingCart, RefreshCw } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { useCart } from '../../../../context/CartContext';
import { useWishlist } from '../../../../context/WishlistContext';
import { useCompare } from '../../../../context/CompareContext';
import styles from './productCard.module.css';

const BASE_URL = 'http://localhost:5001';

export default function ProductCard({ product, t }) {
  const navigate = useNavigate();
  const { addToCart } = useCart();
  const { toggleWishlist, isInWishlist } = useWishlist();
  const { toggleCompare, isInCompare } = useCompare();

  const currentP =
    Number(product.discount_price) && Number(product.discount_price) < Number(product.price)
      ? Number(product.discount_price)
      : Number(product.price);

  const handleCardClick = () => {
    navigate(`/product/${product.id}`);
  };

  const handleAddToCart = e => {
    e.stopPropagation();
    addToCart(product);
  };

  const handleWishlistToggle = e => {
    e.stopPropagation();
    toggleWishlist(product);
  };

  const handleCompareToggle = e => {
    e.stopPropagation();
    toggleCompare(product);
  };

  const handleBuyNow = e => {
    e.stopPropagation();
    navigate(`/product/${product.id}`);
  };

  console.log(product.price, product.discount_price);

  return (
    <div className={styles.flexDiv}>
      <div className={styles.card} onClick={handleCardClick} style={{ cursor: 'pointer' }}>
        <div className={styles.cardImageContainer}>
          <div className={styles.buttonsContainer}>
            <button
              className={`${styles.compareBtn} ${isInCompare(product.id) ? styles.compareBtnActive : ''}`}
              onClick={handleCompareToggle}>
              <RefreshCw size={18} />
            </button>
            <button className={styles.heartBtn} onClick={handleWishlistToggle}>
              {isInWishlist(product.id) ? <HeartIconFilled /> : <HeartIconLight />}
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
              {product.discount_price && Number(product.discount_price) < Number(product.price) && (
                <span className={styles.oldPrice}>{Number(product.price)} ₾</span>
              )}
            </div>
          </div>
          <div className={styles.actionButtons}>
            <button className={styles.addToCartBtn} onClick={handleAddToCart}>
              <ShoppingCart size={15} />
            </button>
            <button className={styles.buyNowBtn} onClick={handleBuyNow}>
              {t('discountSlider.buyNow')}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
