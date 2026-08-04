import { useAuth } from "../../context/AuthContext";
import { useTranslation } from "react-i18next";
import styles from "./User.module.css";

export default function User() {
  const { user, logout } = useAuth();
  const { t } = useTranslation();

  const handleLogout = () => {
    logout();
    window.location.href = "/";
  };

  return (
    <div className={styles.userContainer}>
      <div className={styles.userContent}>
        <h1 className={styles.userTitle}>{t("user.title")}</h1>

        {user ? (
          <div className={styles.userInfo}>
            <div className={styles.userCard}>
              <h2 className={styles.userCardTitle}>{t("user.welcome")}</h2>
              <div className={styles.userDetails}>
                {user.email && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>
                      {t("user.email")}:
                    </span>
                    {user.email}
                  </p>
                )}
                {user.phone_number && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>
                      {t("user.phone")}:
                    </span>
                    {user.phone_number}
                  </p>
                )}
                {user.id && (
                  <p className={styles.userDetail}>
                    <span className={styles.userDetailLabel}>
                      {t("user.userId")}:
                    </span>
                    {user.id}
                  </p>
                )}
              </div>
              <button className={styles.logoutButton} onClick={handleLogout}>
                {t("user.logout")}
              </button>
            </div>
          </div>
        ) : (
          <p className={styles.notLoggedIn}>{t("user.notLoggedIn")}</p>
        )}
      </div>
    </div>
  );
}
