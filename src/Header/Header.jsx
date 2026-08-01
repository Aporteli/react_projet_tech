import { useState, useEffect, useRef } from "react";
import styles from "./Header.module.css"; // შემოგვაქვს როგორც ობიექტი
import CartIcon from "../icons/cartIcon.jsx";
import HeartIcon from "../icons/heartIcon.jsx";
import CompareIcon from "../icons/compareIcon.jsx";
import { FaX } from "react-icons/fa6";
import {
  FiUser,
  FiMenu,
  FiHome,
  FiShoppingCart,
  FiPercent,
  FiHeart,
} from "react-icons/fi";
import { Link } from "react-router-dom";
import SiteLogo from "../icons/siteLogo.jsx";
import SearchIcon from "../icons/searchIcon.jsx";
import { CartIconTooltip } from "../components/tooltips/cartIconTooltip.jsx";
import { WishlistTooltip } from "../components/tooltips/wishlistTooltip.jsx";
import { CompareTooltip } from "../components/tooltips/compareTooltip.jsx";
import { IoIosSearch } from "react-icons/io";
import { GrClearOption } from "react-icons/gr";
import { useTranslation } from "react-i18next";
import CategoriesDropdown from "../components/categoriesDropdown.jsx";

function HeaderDesktop() {
  const { t, i18n } = useTranslation();

  const [categoryOpen, setCategoryOpen] = useState(false);
  const [lengDropdounOpen, setLengDropdounOpen] = useState(false);
  const [currentLanguage, setCurrentLanguage] = useState(i18n.language || "en");
  const [openModal, setOpenModal] = useState(false);
  const [cartHover, setCartHover] = useState(false);
  const [wishlistHover, setWishlistHover] = useState(false);
  const [compareHover, setCompareHover] = useState(false);
  const [headerState, setHeaderState] = useState("visible");
  const lastScrollY = useRef(0);
  const headerHeight = 80;

  const toggleLanguageDropdown = () => {
    setLengDropdounOpen(!lengDropdounOpen);
  };

  const changeLanguage = (lng) => {
    setCurrentLanguage(lng);
    i18n.changeLanguage(lng);
  };

  console.log(currentLanguage);

  const openModalHandler = () => {
    setOpenModal(true);
  };

  const closeModalHandler = () => {
    setOpenModal(false);
  };

  useEffect(() => {
    if (openModal) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "unset";
    }
  }, [openModal]);

  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;

      if (currentScrollY <= 0) {
        setHeaderState("visible");
        lastScrollY.current = currentScrollY;
        return;
      }

      if (currentScrollY > lastScrollY.current) {
        if (
          currentScrollY > headerHeight &&
          currentScrollY <= headerHeight * 1.5
        ) {
          setHeaderState("hidden");
        } else if (currentScrollY > headerHeight * 1.5) {
          if (headerState !== "sticky") {
            setHeaderState("sticky");
          }
        }
      } else if (currentScrollY < lastScrollY.current) {
        setHeaderState("sticky");
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener("scroll", handleScroll, { passive: true });

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, [headerState]);

  // დინამიურად ვადგენთ აქტიურ კლასს styles ობიექტიდან
  const activeClass = styles[headerState];

  return (
    <>
      <div className={styles.headerSpacer}></div>
      <div className={styles.headerContainer}>
        <header className={`${styles.customHeader} ${activeClass}`}>
          {openModal && (
            <>
              <div className={styles.modalOverlay} onClick={closeModalHandler}>
                <div
                  className={styles.modalContent}
                  onClick={(e) => {
                    e.stopPropagation();
                  }}
                >
                  <div className={styles.modalSearchInput}>
                    <div className={styles.modalSearchInputTitle}>
                      {t("header.modal.searchByCategory")}
                    </div>
                    <div className={styles.modalSearchInputCategory}></div>
                  </div>
                  <div className={styles.modalSearchOutput}>
                    <div className={styles.modalSearchOutputHeader}>
                      <div className={styles.modalSearchOutputHeaderTitle}>
                        {t("header.modal.searched")}
                      </div>
                      <div className={styles.modalSearchOutputHeaderClear}>
                        <GrClearOption />
                        <p className={styles.modalSearchOutputHeaderTitleClear}>
                          {t("header.modal.clear")}
                        </p>
                      </div>
                    </div>
                    <div className={styles.modalSearchOutputResults}></div>
                  </div>
                </div>
              </div>
            </>
          )}
          <div className={styles.headerContent}>
            <Link to="/">
              <button className={styles.logoButton}>
                <SiteLogo />
              </button>
            </Link>
            <div
              className={styles.categoriesContainer}
              onMouseEnter={() => setCategoryOpen(true)}
              onMouseLeave={() => setCategoryOpen(false)}
            >
              <button className={styles.categoriesButton}>
                <FiMenu className={styles.menuIcon} />{" "}
                <p className={styles.categoriesButtonText}>
                  {t("header.categories")}
                </p>
              </button>

              {categoryOpen && <CategoriesDropdown />}
            </div>
            <div className={styles.headerActions}>
              <div
                className={`${styles.searchBar} ${openModal ? styles.searchBarOpen : ""}`}
              >
                <input
                  onClick={openModalHandler}
                  className={styles.searchInput}
                  type="text"
                  placeholder={t("header.searchPlaceholder")}
                />
                <SearchIcon />
              </div>
              <div className={styles.headerCart}>
                <div
                  className={styles.cartIconWrapper}
                  onMouseEnter={() => setCartHover(true)}
                  onMouseLeave={() => setCartHover(false)}
                >
                  <Link to="/cart" className={styles.iconLink}>
                    <CartIcon />
                  </Link>
                  {cartHover && <CartIconTooltip />}
                </div>
                <div
                  className={styles.cartIconWrapper}
                  onMouseEnter={() => setWishlistHover(true)}
                  onMouseLeave={() => setWishlistHover(false)}
                >
                  <Link to="/wishlist" className={styles.iconLink}>
                    <HeartIcon />
                  </Link>
                  {wishlistHover && <WishlistTooltip />}
                </div>
                <div
                  className={styles.cartIconWrapper}
                  onMouseEnter={() => setCompareHover(true)}
                  onMouseLeave={() => setCompareHover(false)}
                >
                  <Link to="/compare" className={styles.iconLink}>
                    <CompareIcon />
                  </Link>
                  {compareHover && <CompareTooltip />}
                </div>
              </div>
              <button className={styles.loginButton}>
                <div className={styles.loginButtonContent}>
                  <FiUser size={22} />{" "}
                  <p className={styles.loginButtonText}>{t("header.signIn")}</p>
                </div>
              </button>
              <div className={styles.languageContainer}>
                <button
                  className={styles.languageButton}
                  onClick={toggleLanguageDropdown}
                >
                  {currentLanguage === "en" ? "ENG" : "RUS"}
                </button>

                <button
                  className={`
                      ${styles.languageDropdownButton} 
                      ${lengDropdounOpen ? styles.languageDropdownButtonOpen : ""}
                    `}
                  onClick={() => {
                    changeLanguage(currentLanguage === "en" ? "ru" : "en");
                    toggleLanguageDropdown();
                  }}
                >
                  {currentLanguage === "en" ? "RUS" : "ENG"}
                </button>
              </div>
            </div>
          </div>
        </header>
      </div>
    </>
  );
}

/* Header for tablets */

function HeaderTablet() {
  const { t, i18n } = useTranslation();
  const [headerState, setHeaderState] = useState("visible");
  const [categoryOpen, setCategoryOpen] = useState(false);
  const [openModal, setOpenModal] = useState(false);
  const [lengDropdounOpen, setLengDropdounOpen] = useState(false);
  const [currentLanguage, setCurrentLanguage] = useState(i18n.language || "en");
  const lastScrollY = useRef(0);
  const headerHeight = 80;

  const toggleLanguageDropdown = () => {
    setLengDropdounOpen(!lengDropdounOpen);
  };

  const changeLanguage = (lng) => {
    setCurrentLanguage(lng);
    i18n.changeLanguage(lng);
  };

  const openModalHandler = () => {
    setOpenModal(true);
  };

  const closeModalHandler = () => {
    setOpenModal(false);
  };

  useEffect(() => {
    if (openModal) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "unset";
    }
  }, [openModal]);

  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;

      if (currentScrollY <= 0) {
        setHeaderState("visible");
        lastScrollY.current = currentScrollY;
        return;
      }

      if (currentScrollY > lastScrollY.current) {
        if (
          currentScrollY > headerHeight &&
          currentScrollY <= headerHeight * 1.5
        ) {
          setHeaderState("hidden");
        } else if (currentScrollY > headerHeight * 1.5) {
          if (headerState !== "sticky") {
            setHeaderState("sticky");
          }
        }
      } else if (currentScrollY < lastScrollY.current) {
        setHeaderState("sticky");
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener("scroll", handleScroll, { passive: true });

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, [headerState]);

  useEffect(() => {
    if (categoryOpen) {
      document.body.style.overflow = "hidden"; // თიშავს ძირითად სქროლს
    } else {
      document.body.style.overflow = "unset"; // აბრუნებს სქროლს დახურვისას
    }

    // კომპონენტის წაშლისას (Cleanup)
    return () => {
      document.body.style.overflow = "unset";
    };
  }, [categoryOpen]);

  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === "Escape") {
        setCategoryOpen(false);
      }
    };

    if (categoryOpen) {
      window.addEventListener("keydown", handleKeyDown);
    }

    return () => {
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, [categoryOpen]);

  // დინამიურად ვადგენთ აქტიურ კლასს styles ობიექტიდან
  const activeClass = styles[headerState];

  return (
    <>
      <div className={styles.tabletHeaderSpacer}></div>
      <div className={styles.tabletHeaderContainer}>
        <header className={`${styles.tabletHeader} ${activeClass}`}>
          {openModal && (
            <>
              <div className={styles.modalOverlay} onClick={closeModalHandler}>
                <div
                  className={styles.modalContent}
                  onClick={(e) => {
                    e.stopPropagation();
                  }}
                >
                  <div className={styles.modalSearchInput}>
                    <div className={styles.modalSearchInputTitle}>
                      {t("header.modal.searchByCategory")}
                    </div>
                    <div className={styles.modalSearchInputCategory}></div>
                  </div>
                  <div className={styles.modalSearchOutput}>
                    <div className={styles.modalSearchOutputHeader}>
                      <div className={styles.modalSearchOutputHeaderTitle}>
                        {t("header.modal.searched")}
                      </div>
                      <div className={styles.modalSearchOutputHeaderClear}>
                        <GrClearOption />
                        <p className={styles.modalSearchOutputHeaderTitleClear}>
                          {t("header.modal.clear")}
                        </p>
                      </div>
                    </div>
                    <div className={styles.modalSearchOutputResults}></div>
                  </div>
                </div>
              </div>
            </>
          )}
          <div className={styles.tabletHeaderContent}>
            <button
              className={styles.tabletCategoriesButton}
              onClick={() => setCategoryOpen(!categoryOpen)}
            >
              <FiMenu className={styles.tabletMenuIcon} />
            </button>
            <button className={styles.tabletLogoButton}>
              <SiteLogo />
            </button>

            <div className={styles.tabletHeaderActions}>
              <button
                className={styles.tabletSearchButton}
                onClick={openModalHandler}
              >
                <IoIosSearch />
              </button>
              <div className={styles.tabletLanguageContainer}>
                <button
                  className={styles.tabletLanguageButton}
                  onClick={toggleLanguageDropdown}
                >
                  {currentLanguage === "en" ? "ENG" : "RUS"}
                </button>

                <button
                  className={`
                      ${styles.tabletLanguageDropdownButton} 
                      ${lengDropdounOpen ? styles.tabletLanguageDropdownButtonOpen : ""}
                    `}
                  onClick={() => {
                    changeLanguage(currentLanguage === "en" ? "ru" : "en");
                    toggleLanguageDropdown();
                  }}
                >
                  {currentLanguage === "en" ? "RUS" : "ENG"}
                </button>
              </div>
            </div>
          </div>
        </header>
      </div>
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

      {categoryOpen && (
        <div
          className={styles.tabletCategoryPanel}
          onClick={() => setCategoryOpen(false)}
        >
          <div
            className={styles.tabletCategoryPanelContent}
            onClick={(e) => e.stopPropagation()}
          >
            <div className={styles.tabletCategoryPanelHeader}>
              <h2 className={styles.tabletCategoryPanelTitle}>Categories</h2>
              <button
                className={styles.tabletCategoryPanelClose}
                onClick={() => setCategoryOpen(false)}
              >
                <FaX />
              </button>
            </div>
            <CategoriesDropdown />
          </div>
        </div>
      )}
    </>
  );
}

function Header() {
  // საწყის მნიშვნელობად ეგრევე ეკრანის რეალურ ზომას ვიღებთ
  const [windowWidth, setWindowWidth] = useState(window.innerWidth);

  useEffect(() => {
    const handleResize = () => {
      setWindowWidth(window.innerWidth); // ეს უკვე გამოიწვევს რენდერს
    };

    window.addEventListener("resize", handleResize);

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  if (windowWidth > 1180) {
    return <HeaderDesktop />;
  } else {
    return <HeaderTablet />;
  }
}

export default Header;
