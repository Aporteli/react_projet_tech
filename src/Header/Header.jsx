import { useState, useEffect, useRef } from "react";
import styles from "./Header.module.css"; // შემოგვაქვს როგორც ობიექტი
import CartIcon from "../icons/cartIcon.jsx";
import { useCart } from "../context/CartContext";
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
import { Link, useNavigate } from "react-router-dom";
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
  const { cartCount } = useCart();
  const navigate = useNavigate();
  const [cartAnimation, setCartAnimation] = useState(false);

  const [categoryOpen, setCategoryOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [searchResults, setSearchResults] = useState([]);
  const [searchLoading, setSearchLoading] = useState(false);
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

  // Trigger cart animation when cart count changes
  useEffect(() => {
    if (cartCount > 0) {
      setCartAnimation(true);
      setTimeout(() => {
        setCartAnimation(false);
      }, 500);
    }
  }, [cartCount]);

  console.log(currentLanguage);

  const openModalHandler = () => {
    setOpenModal(true);
  };

  const closeModalHandler = () => {
    setOpenModal(false);
    setSearchQuery("");
    setSearchResults([]);
  };

  const handleSearch = async (query) => {
    setSearchQuery(query);

    if (query.trim().length < 2) {
      setSearchResults([]);
      return;
    }

    setSearchLoading(true);
    try {
      const response = await fetch(
        `http://localhost:5001/api/search?q=${encodeURIComponent(query)}&lang=${i18n.language}`,
      );
      const data = await response.json();
      setSearchResults(data);
    } catch (error) {
      console.error("Search error:", error);
      setSearchResults([]);
    } finally {
      setSearchLoading(false);
    }
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
                    <input
                      className={styles.modalSearchInputField}
                      type="text"
                      placeholder={t("header.modal.searchByCategory")}
                      value={searchQuery}
                      onChange={(e) => handleSearch(e.target.value)}
                      autoFocus
                    />
                  </div>
                  <div className={styles.modalSearchOutput}>
                    <div className={styles.modalSearchOutputHeader}>
                      <div className={styles.modalSearchOutputHeaderTitle}>
                        {t("header.modal.searched")}
                      </div>
                      {searchQuery && (
                        <div
                          className={styles.modalSearchOutputHeaderClear}
                          onClick={() => {
                            setSearchQuery("");
                            setSearchResults([]);
                          }}
                        >
                          <GrClearOption />
                          <p
                            className={styles.modalSearchOutputHeaderTitleClear}
                          >
                            {t("header.modal.clear")}
                          </p>
                        </div>
                      )}
                    </div>
                    <div className={styles.modalSearchOutputResults}>
                      {searchLoading && (
                        <div className={styles.searchLoading}>Loading...</div>
                      )}
                      {!searchLoading &&
                        searchResults.length === 0 &&
                        searchQuery.length >= 2 && (
                          <div className={styles.noResults}>
                            No results found
                          </div>
                        )}
                      {!searchLoading &&
                        searchResults.map((product) => (
                          <div className={styles.searchResultItem}>
                            <Link
                              key={product.id}
                              to={`/product/${product.slug}`}
                              className={styles.searchResultItemLink}
                              onClick={closeModalHandler}
                            >
                              <img
                                src={`http://localhost:5001/uploads/${product.image}`}
                                alt={product.name}
                                className={styles.searchResultImage}
                              />
                              <div className={styles.searchResultInfo}>
                                <h4 className={styles.searchResultName}>
                                  {product.name}
                                </h4>
                                <p className={styles.searchResultPrice}>
                                  {product.discount_price
                                    ? product.discount_price
                                    : product.price}{" "}
                                  ₾
                                </p>
                              </div>
                            </Link>
                          </div>
                        ))}
                    </div>
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
                  value={searchQuery}
                  onChange={(e) => handleSearch(e.target.value)}
                />
                <SearchIcon />
              </div>
              <div className={styles.headerCart}>
                <div
                  className={styles.cartIconWrapper}
                  onMouseEnter={() => setCartHover(true)}
                  onMouseLeave={() => setCartHover(false)}
                >
                  <Link
                    to="/cart"
                    className={`${styles.iconLink} ${cartAnimation ? styles.cartJump : ""}`}
                  >
                    <CartIcon />
                    {cartCount > 0 && (
                      <span className={styles.cartCount}>{cartCount}</span>
                    )}
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
  const [searchQuery, setSearchQuery] = useState("");
  const [searchResults, setSearchResults] = useState([]);
  const [searchLoading, setSearchLoading] = useState(false);
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
    setSearchQuery("");
    setSearchResults([]);
  };

  const handleSearch = async (query) => {
    setSearchQuery(query);

    if (query.trim().length < 2) {
      setSearchResults([]);
      return;
    }

    setSearchLoading(true);
    try {
      const response = await fetch(
        `http://localhost:5001/api/search?q=${encodeURIComponent(query)}&lang=${i18n.language}`,
      );
      const data = await response.json();
      setSearchResults(data);
    } catch (error) {
      console.error("Search error:", error);
      setSearchResults([]);
    } finally {
      setSearchLoading(false);
    }
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
                    <input
                      className={styles.modalSearchInputField}
                      type="text"
                      placeholder={t("header.modal.searchByCategory")}
                      value={searchQuery}
                      onChange={(e) => handleSearch(e.target.value)}
                      autoFocus
                    />
                  </div>
                  <div className={styles.modalSearchOutput}>
                    <div className={styles.modalSearchOutputHeader}>
                      <div className={styles.modalSearchOutputHeaderTitle}>
                        {t("header.modal.searched")}
                      </div>
                      {searchQuery && (
                        <div
                          className={styles.modalSearchOutputHeaderClear}
                          onClick={() => {
                            setSearchQuery("");
                            setSearchResults([]);
                          }}
                        >
                          <GrClearOption />
                          <p
                            className={styles.modalSearchOutputHeaderTitleClear}
                          >
                            {t("header.modal.clear")}
                          </p>
                        </div>
                      )}
                    </div>
                    <div className={styles.modalSearchOutputResults}>
                      {searchLoading && (
                        <div className={styles.searchLoading}>Loading...</div>
                      )}
                      {!searchLoading &&
                        searchResults.length === 0 &&
                        searchQuery.length >= 2 && (
                          <div className={styles.noResults}>
                            No results found
                          </div>
                        )}
                      {!searchLoading &&
                        searchResults.map((product) => (
                          <Link
                            key={product.id}
                            to={`/product/${product.slug}`}
                            className={styles.searchResultItem}
                            onClick={closeModalHandler}
                          >
                            <img
                              src={`http://localhost:5001/uploads/${product.image}`}
                              alt={product.name}
                              className={styles.searchResultImage}
                            />
                            <div className={styles.searchResultInfo}>
                              <h4 className={styles.searchResultName}>
                                {product.name}
                              </h4>
                              <p className={styles.searchResultPrice}>
                                {product.discount_price
                                  ? product.discount_price
                                  : product.price}{" "}
                                ₾
                              </p>
                            </div>
                          </Link>
                        ))}
                    </div>
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
              <SiteLogo className={styles.tabletLogo} />
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
