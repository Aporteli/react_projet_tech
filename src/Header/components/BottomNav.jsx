import { Link } from "react-router-dom";
import {
  FiHome,
  FiShoppingCart,
  FiPercent,
  FiHeart,
  FiUser,
} from "react-icons/fi";
import styles from "../Header.module.css";

export default function BottomNav() {
  return (
    <div className={styles.bottomNav}>
      <Link to="/" className={styles.bottomNavItem}>
        <FiHome className={styles.bottomNavIcon} />
        <span className={styles.bottomNavText}>Home</span>
      </Link>
      <Link to="/cart" className={styles.bottomNavItem}>
        <FiShoppingCart className={styles.bottomNavIcon} />
        <span className={styles.bottomNavText}>Cart</span>
      </Link>
      <Link to="/promotions" className={styles.bottomNavItem}>
        <FiPercent className={styles.bottomNavIcon} />
        <span className={styles.bottomNavText}>Promotions</span>
      </Link>
      <Link to="/wishlist" className={styles.bottomNavItem}>
        <FiHeart className={styles.bottomNavIcon} />
        <span className={styles.bottomNavText}>Saved</span>
      </Link>
      <Link to="/signin" className={styles.bottomNavItem}>
        <FiUser className={styles.bottomNavIcon} />
        <span className={styles.bottomNavText}>Sign In</span>
      </Link>
    </div>
  );
}
