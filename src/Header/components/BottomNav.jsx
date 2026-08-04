import { Link } from "react-router-dom";
import {
  FiHome,
  FiShoppingCart,
  FiPercent,
  FiHeart,
  FiUser,
} from "react-icons/fi";
import { useAuth } from "../../context/AuthContext";
import styles from "../Header.module.css";

export default function BottomNav({ onSignInClick, isAuthenticated }) {
  const { user } = useAuth();

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
      {isAuthenticated ? (
        <Link to="/user" className={styles.bottomNavItem}>
          <div className={styles.bottomNavUserAvatar}>
            <FiUser className={styles.bottomNavIcon} />
          </div>
          <span className={styles.bottomNavText}>
            {user?.email ? user.email.split("@")[0] : "User"}
          </span>
        </Link>
      ) : (
        <button className={styles.bottomNavItem} onClick={onSignInClick}>
          <FiUser className={styles.bottomNavIcon} />
          <span className={styles.bottomNavText}>Sign In</span>
        </button>
      )}
    </div>
  );
}
