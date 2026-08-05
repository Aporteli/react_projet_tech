import styles from './wishlist.module.css';
import { useTranslation } from 'react-i18next';
import { useWishlist } from '../context/WishlistContext';
import { Link } from 'react-router-dom';
import { ShoppingCart, Trash2, RefreshCw } from 'lucide-react';
import { useCart } from '../context/CartContext';
import HeartIconLight from '../icons/heartIconLight';
import HeartIconFilled from '../icons/heartIconFilled';

const BASE_URL = 'http://localhost:5001';

export default function Wishlist() {
  const { t } = useTranslation();
  const { wishlistItems, removeFromWishlist, toggleWishlist, isInWishlist } = useWishlist();
  const { addToCart } = useCart();

  const handleAddToCart = product => {
    addToCart(product);
  };

  const handleRemoveFromWishlist = productId => {
    removeFromWishlist(productId);
  };

  const handleWishlistToggle = product => {
    toggleWishlist(product);
  };

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>{t('wishlist.title') || 'Wishlist'}</h1>
      </div>
      <div className={styles.content}>
        {wishlistItems.length === 0 ? (
          <div className={styles.emptyWishlist}>
            <p className={styles.emptyMessage}>{t('wishlist.empty') || 'Your wishlist is empty'}</p>
          </div>
        ) : (
          <div className={styles.wishlistGrid}>
            {wishlistItems.map(product => {
              const currentP =
                Number(product.discountPrice) && Number(product.discountPrice) < Number(product.price)
                  ? Number(product.discountPrice)
                  : Number(product.price);

              return (
                <div key={product.id} className={styles.wishlistItem}>
                  <div className={styles.cardImageContainer}>
                    <div className={styles.buttonsContainer}>
                      <button className={styles.compareBtn} onClick={e => e.preventDefault()}>
                        <RefreshCw size={18} />
                      </button>
                      <button className={styles.heartBtn} onClick={() => handleWishlistToggle(product)}>
                        {isInWishlist(product.id) ? <HeartIconFilled /> : <HeartIconLight />}
                      </button>
                    </div>
                    <img src={`${BASE_URL}/uploads/${product.image}`} alt={product.name} />
                  </div>
                  <div className={styles.cardContent}>
                    <Link to={`/product/${product.id}`} className={styles.productName}>
                      {product.name}
                    </Link>
                    <div className={styles.priceSection}>
                      <div className={styles.priceContainer}>
                        <span className={styles.currentPrice}>{currentP} ₾</span>
                        {product.discountPrice && Number(product.discountPrice) < Number(product.price) && (
                          <span className={styles.oldPrice}>{Number(product.price)} ₾</span>
                        )}
                      </div>
                    </div>
                    <div className={styles.actionButtons}>
                      <button className={styles.addToCartBtn} onClick={() => handleAddToCart(product)}>
                        <ShoppingCart size={15} />
                      </button>
                      <button className={styles.buyNowBtn} onClick={e => e.preventDefault()}>
                        {t('discountSlider.buyNow')}
                      </button>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}
