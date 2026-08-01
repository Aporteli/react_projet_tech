import styles from "./subCategoryPage.module.css";
import "overlayscrollbars/overlayscrollbars.css";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import HeartIconLight from "../../icons/heartIconLight";
import { ShoppingCart, RefreshCw } from "lucide-react";
import { Link, useParams, useSearchParams } from "react-router-dom";
import { useTranslation } from "react-i18next";
import {
  fetchSubCategories,
  fetchSubCateogryScreenAttributes,
  fetchCategoryBrands,
} from "../../api/categoryService";
import { useState, useEffect, useRef, useMemo } from "react";
import { IoIosArrowDown, IoIosArrowForward } from "react-icons/io";
import PriceFilter from "../../components/priceFilter";
import "rc-slider/assets/index.css";

const BASE_URL = "http://localhost:5001";

export default function SubCategoryPage() {
  const sortRef = useRef(null);
  const [visibleCount, setVisibleCount] = useState(16);
  const [openDropDowns, setOpenDropDowns] = useState([]);
  const [subCategories, setSubCategories] = useState([]);
  const [screenAttributes, setScreenAttributes] = useState(null);
  const [brands, setBrands] = useState([]);
  const [sortOptions, setSortOptions] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const [priceRange, setPriceRange] = useState([0, 7169]);
  const { t, i18n } = useTranslation();
  const { slug } = useParams();
  const ITEMS_PER_GROUP = 16;

  const handleSeeMore = () => {
    setVisibleCount((prevCount) => prevCount + ITEMS_PER_GROUP);
  };

  const toggleDropDown = (index) => {
    setOpenDropDowns((prev) =>
      prev.includes(index) ? prev.filter((i) => i !== index) : [...prev, index],
    );
  };

  const handleSelectSort = (type) => {
    setSearchParams({ sort: type });
    setSortOptions(false);
  };

  const handlePriceChange = (newRange) => {
    setPriceRange(newRange);
  };

  const sortTypes = [
    { id: "all", label: t("sort.title") },
    { id: "priceAsc", label: t("sort.priceDecrese") },
    { id: "priceDesc", label: t("sort.priceIncrease") },
    { id: "nameAsc", label: t("sort.name") },
    { id: "nameDesc", label: t("sort.nameReverse") },
  ];
  const sortType = searchParams.get("sort") || "all";
  const selectedOption =
    sortTypes.find((option) => option.id === sortType) || sortTypes[0];

  // 1. slug-ის შეცვლისთანავე ძველი მონაცემების გასუფთავება
  useEffect(() => {
    setSubCategories([]);
    setScreenAttributes(null);
    setBrands([]);
    setOpenDropDowns([]);
  }, [slug]);

  // 2. Fetch subcategories data
  useEffect(() => {
    let ignore = false;
    if (slug) {
      fetchSubCategories(slug, i18n.language)
        .then((data) => {
          if (!ignore) setSubCategories(data);
        })
        .catch((err) => console.error(err));
    }
    return () => {
      ignore = true;
    };
  }, [slug, i18n.language]);

  // 3. Fetch screenAttributes data
  useEffect(() => {
    let ignore = false;
    if (slug) {
      fetchSubCateogryScreenAttributes(slug, i18n.language)
        .then((data) => {
          if (!ignore) setScreenAttributes(data);
        })
        .catch((err) => console.error(err));
    }
    return () => {
      ignore = true;
    };
  }, [slug, i18n.language]);

  console.log(screenAttributes);

  // 4. Fetch brands data
  useEffect(() => {
    let ignore = false;
    if (slug) {
      fetchCategoryBrands(slug)
        .then((data) => {
          if (!ignore) setBrands(data);
        })
        .catch((err) => console.error(err));
    }
    return () => {
      ignore = true;
    };
  }, [slug]);

  // Click Outside logic for sort dropdown
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (sortRef.current && !sortRef.current.contains(event.target)) {
        setSortOptions(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  // 5. ბექენდის ახალი filters ობიექტის გადაყვანა მასივში
  const formattedFilters = useMemo(() => {
    if (!screenAttributes || !screenAttributes.filters) return [];

    return Object.entries(screenAttributes.filters).map(
      ([attrName, options]) => {
        // თუ ბრენდის ატრიბუტია და ცალკე წამოღებული ბრენდები გაქვთ, გამოიყენოს ის
        if (attrName.toLowerCase() === "brand" && brands && brands.length > 0) {
          return {
            attribute_name: attrName,
            options: brands,
          };
        }

        return {
          attribute_name: attrName,
          options: options || [],
        };
      },
    );
  }, [screenAttributes, brands]);

  // დამხმარე ფუნქცია რეალური (აქტუალური) ფასის მოსაპოვებლად
  const getEffectivePrice = (product) => {
    const p = Number(product.price) || 0;
    const dp = Number(product.discountPrice) || 0;
    return dp > 0 && dp < p ? dp : p;
  };

  // სორტირების ლოგიკა useMemo-ში
  const sortedProducts = useMemo(() => {
    if (!subCategories) return [];

    // ფასის ფილტრაცია
    let filtered = [...subCategories].filter((product) => {
      const price = getEffectivePrice(product);
      return price >= priceRange[0] && price <= priceRange[1];
    });

    // სორტირება
    return filtered.sort((a, b) => {
      const priceA = getEffectivePrice(a);
      const priceB = getEffectivePrice(b);

      if (sortType === "priceAsc") {
        return priceA - priceB;
      }
      if (sortType === "priceDesc") {
        return priceB - priceA;
      }
      if (sortType === "nameAsc") {
        return a.name.localeCompare(b.name);
      }
      if (sortType === "nameDesc") {
        return b.name.localeCompare(a.name);
      }
      return 0;
    });
  }, [subCategories, sortType, priceRange]);

  const handleFilterChange = (attrName, value, isChecked) => {
    // აქ დაწერთ ფილტრაციის ჩართვა/გამორთვის ლოგიკას
    console.log(attrName, value, isChecked);
  };

  return (
    <div className={styles.container}>
      <div className={styles.gridContainer}>
        <div className={styles.filterGrid}>
          <div className={styles.filterGridHeader}></div>
          <div className={styles.filterGridPrice}>
            <PriceFilter onPriceChange={handlePriceChange} />
          </div>
          <div className={styles.filterGridDropDown}>
            {formattedFilters.map((attribute, index) => {
              const isOpen = openDropDowns.includes(index);

              return (
                <div
                  key={attribute.attribute_name || index}
                  className={`${styles.filterGridDropDownItem} ${
                    styles[`filterGridDropDownItem${index}`]
                  }`}
                  onClick={() => toggleDropDown(index)}
                >
                  <div className={styles.filterGridDropDownItemContent}>
                    <p className={styles.filterGridDropDownItemName}>
                      {attribute.attribute_name}
                    </p>
                    <IoIosArrowDown />
                  </div>

                  <OverlayScrollbarsComponent
                    element="div"
                    options={{
                      scrollbars: {
                        autoHide: "leave",
                        theme: "os-theme-dark",
                      },
                    }}
                    className={`${styles.filterGridDropDownItemList} ${
                      isOpen ? styles.filterGridDropDownItemListActive : ""
                    }`}
                    onClick={(e) => e.stopPropagation()}
                  >
                    {attribute.options && attribute.options.length > 0 ? (
                      attribute.options.map((option, optIndex) => {
                        const optValue =
                          typeof option === "object"
                            ? option.id || option.name
                            : option;
                        const optLabel =
                          typeof option === "object" ? option.name : option;

                        return (
                          <label
                            key={optIndex}
                            className={styles.filterCheckboxItem}
                          >
                            <input
                              type="checkbox"
                              value={optValue}
                              onChange={(e) =>
                                handleFilterChange(
                                  attribute.attribute_name,
                                  optValue,
                                  e.target.checked,
                                )
                              }
                            />
                            <span>{optLabel}</span>
                          </label>
                        );
                      })
                    ) : (
                      <p>მონაცემები არ არის</p>
                    )}
                  </OverlayScrollbarsComponent>
                </div>
              );
            })}
          </div>
        </div>

        <div className={styles.productsGrid}>
          <p className={styles.breadcrumb}>
            Home Page
            <IoIosArrowForward />
            {subCategories[0]?.parentCategory}
            <IoIosArrowForward />
            {subCategories[0]?.subCategory}
          </p>
          <div className={styles.subCategoryHeader}>
            <h1 className={styles.subCategoryTitle}>
              {subCategories[0]?.subCategory}
            </h1>

            <div className={styles.arrangeContainer} ref={sortRef}>
              <div
                className={styles.arrangeContent}
                onClick={() => setSortOptions(!sortOptions)}
              >
                <p className={styles.arrangeText}>{selectedOption.label}</p>
                <IoIosArrowDown />
              </div>

              {sortOptions && (
                <div className={styles.sortOptionsContainer}>
                  <div className={styles.sortOptions}>
                    <div
                      className={styles.sortOption}
                      onClick={() => handleSelectSort("all")}
                    >
                      {t("sort.all")}
                    </div>
                    <div
                      className={styles.sortOption}
                      onClick={() => handleSelectSort("priceDesc")}
                    >
                      {t("sort.priceDecrese")}
                    </div>
                    <div
                      className={styles.sortOption}
                      onClick={() => handleSelectSort("priceAsc")}
                    >
                      {t("sort.priceIncrease")}
                    </div>
                    <div
                      className={styles.sortOption}
                      onClick={() => handleSelectSort("nameAsc")}
                    >
                      {t("sort.name")}
                    </div>
                    <div
                      className={styles.sortOption}
                      onClick={() => handleSelectSort("nameDesc")}
                    >
                      {t("sort.nameReverse")}
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>

          <div className={styles.mainDiv}>
            <div className={styles.outerDiv}>
              <div className={styles.sliderDiv}>
                {sortedProducts.slice(0, visibleCount).map((product, index) => {
                  const currentP =
                    Number(product.discountPrice) &&
                    Number(product.discountPrice) < Number(product.price)
                      ? Number(product.discountPrice)
                      : Number(product.price);

                  return (
                    <div key={index} className={styles.flexDiv}>
                      <Link className={styles.card}>
                        <div className={styles.cardImageContainer}>
                          <div className={styles.buttonsContainer}>
                            <button
                              className={styles.compareBtn}
                              onClick={(e) => e.preventDefault()}
                            >
                              <RefreshCw size={18} />
                            </button>
                            <button className={styles.heartBtn}>
                              <HeartIconLight />
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
                              <span className={styles.currentPrice}>
                                {currentP} ₾
                              </span>
                              {product.discountPrice &&
                                Number(product.discountPrice) <
                                  Number(product.price) && (
                                  <span className={styles.oldPrice}>
                                    {Number(product.price)} ₾
                                  </span>
                                )}
                            </div>
                          </div>
                          <div className={styles.actionButtons}>
                            <button
                              className={styles.addToCartBtn}
                              onClick={(e) => e.preventDefault()}
                            >
                              <ShoppingCart size={15} />
                            </button>
                            <button
                              className={styles.buyNowBtn}
                              onClick={(e) => e.preventDefault()}
                            >
                              {t("discountSlider.buyNow")}
                            </button>
                          </div>
                        </div>
                      </Link>
                    </div>
                  );
                })}
              </div>
              {/* 3. See More ღილაკი — გამოჩნდება მხოლოდ მაშინ, თუ კიდევ დარჩა დასამალი პროდუქტები */}
              {visibleCount < sortedProducts.length && (
                <div className={styles.seeMoreContainer}>
                  <button className={styles.seeMoreBtn} onClick={handleSeeMore}>
                    See More
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
