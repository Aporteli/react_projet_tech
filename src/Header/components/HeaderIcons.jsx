import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import CartIcon from '../../icons/cartIcon.jsx';
import { useCart } from '../../context/CartContext';
import HeartIcon from '../../icons/heartIcon.jsx';
import CompareIcon from '../../icons/compareIcon.jsx';
import { CartIconTooltip } from '../../components/tooltips/cartIconTooltip.jsx';
import { WishlistTooltip } from '../../components/tooltips/wishlistTooltip.jsx';
import { CompareTooltip } from '../../components/tooltips/compareTooltip.jsx';
import styles from '../Header.module.css';

export default function HeaderIcons() {
  const { cartCount } = useCart();
  const [cartAnimation, setCartAnimation] = useState(false);
  const [cartHover, setCartHover] = useState(false);
  const [wishlistHover, setWishlistHover] = useState(false);
  const [compareHover, setCompareHover] = useState(false);

  useEffect(() => {
    if (cartCount > 0) {
      setCartAnimation(true);
      setTimeout(() => {
        setCartAnimation(false);
      }, 500);
    }
  }, [cartCount]);

  return (
    <div className={styles.headerCart}>
      <div
        className={styles.cartIconWrapper}
        onMouseEnter={() => setCartHover(true)}
        onMouseLeave={() => setCartHover(false)}>
        <Link to="/cart" className={`${styles.iconLink} ${cartAnimation ? styles.cartJump : ''}`}>
          <CartIcon />
          {cartCount > 0 && <span className={styles.cartCount}>{cartCount}</span>}
        </Link>
        {cartHover && <CartIconTooltip />}
      </div>
      <div
        className={styles.cartIconWrapper}
        onMouseEnter={() => setWishlistHover(true)}
        onMouseLeave={() => setWishlistHover(false)}>
        <Link to="/wishlist" className={styles.iconLink}>
          <HeartIcon />
        </Link>
        {wishlistHover && <WishlistTooltip />}
      </div>
      <div
        className={styles.cartIconWrapper}
        onMouseEnter={() => setCompareHover(true)}
        onMouseLeave={() => setCompareHover(false)}>
        <Link to="/compare" className={styles.iconLink}>
          <CompareIcon />
        </Link>
        {compareHover && <CompareTooltip />}
      </div>
    </div>
  );
}
