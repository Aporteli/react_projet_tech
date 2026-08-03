import { useAuth } from "../../context/AuthContext";
import styles from "./User.module.css";

export default function User() {
  const { user, logout } = useAuth();

  const handleLogout = () => {
    logout();
    window.location.href = "/";
  };

  return (
    <div className={styles.userContainer}>
      <div className={styles.userContent}>
        <h1 className={styles.userTitle}>User Profile</h1>
        
        {user ? (
          <div className={styles.userInfo}>
            <div className={styles.userCard}>
              <h2 className={styles.userCardTitle}>Welcome!</h2>
              <div className={styles.userDetails}>
                {user.email && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>Email:</span>
                    {user.email}
                  </p>
                )}
                {user.phone_number && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>Phone:</span>
                    {user.phone_number}
                  </p>
                )}
                {user.id && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>User ID:</span>
                    {user.id}
                  </p>
                )}
              </div>
              <button className={styles.logoutButton} onClick={handleLogout}>
                Logout
              </button>
            </div>
          </div>
        ) : (
          <p className={styles.notLoggedIn}>You are not logged in.</p>
        )}
      </div>
    </div>
  );
}
