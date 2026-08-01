import { Outlet } from "react-router-dom";
import Header from "./Header/Header";
import Footer from "./Footer/Footer";
import styles from "./layout.module.css";
import { FaPhoneAlt } from "react-icons/fa";

function Layout() {
  return (
    <>
      <div className={styles.container}>
        <Header />
        <div className={styles.movingDivider}></div>
        <main className={styles.main}>
          <div className={styles.home}>
            <div className={styles.homeContent}>
              <div className={styles.subheader}>
                <p className={styles.subheaderNumber}>
                  <FaPhoneAlt /> *3838 / (032) 222-22-22
                </p>
                <div className={styles.subheaderLinks}>
                  <p className={styles.subheaderLink}>Blog</p>
                  <p className={styles.subheaderLink}>Shops</p>
                  <p className={styles.subheaderLink}>All Promotions</p>
                </div>
              </div>
              <div className={styles.movingDivider}></div>
            </div>
          </div>
          <Outlet />
        </main>
        <Footer />
      </div>
    </>
  );
}

export default Layout;
