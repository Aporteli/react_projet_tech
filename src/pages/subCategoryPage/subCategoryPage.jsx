import styles from "./subCategoryPage.module.css";
import { useParams, useSearchParams } from "react-router-dom";
import { useTranslation } from "react-i18next";
import {
  fetchSubCategories,
  fetchSubCateogryScreenAttributes,
  fetchCategoryBrands,
} from "../../api/categoryService";
import { useState, useEffect, useRef, useMemo } from "react";
import PriceFilter from "../../components/priceFilter";
import ProductCard from "./components/productCard/productCard";
import FilterDropdown from "./components/filterDropdown/filterDropdown";
import MobileFilter from "./components/mobileFilter/mobileFilter";
import SortDropdown from "./components/sortDropdown/sortDropdown";
import Breadcrumb from "./components/breadcrumb/breadcrumb";
import MobileFilters from "./components/mobileFilters/mobileFilters";
import "rc-slider/assets/index.css";

const BASE_URL = "http://localhost:5001";

export default function SubCategoryPage() {
  const sortRef = useRef(null);
  const mobileSortRef = useRef(null);
  const mobileFilterRef = useRef(null);
  const [mobileFilterOpen, setMobileFilterOpen] = useState(false);
  const [windowWidth, setWindowWidth] = useState(window.innerWidth);
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

  const handleWindowResize = () => {
    setWindowWidth(window.innerWidth);
  };

  useEffect(() => {
    window.addEventListener("resize", handleWindowResize);
    return () => {
      window.removeEventListener("resize", handleWindowResize);
    };
  }, []);

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
    { id: "priceAsc", label: t("sort.priceIncrease") },
    { id: "priceDesc", label: t("sort.priceDecrese") },
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

  console.log(screenAttributes, "screenAttributes");

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

  // Click Outside logic for sort dropdown and mobile filter
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (sortRef.current && !sortRef.current.contains(event.target)) {
        setSortOptions(false);
      }
      if (
        mobileSortRef.current &&
        !mobileSortRef.current.contains(event.target)
      ) {
        setSortOptions(false);
      }
      if (
        mobileFilterRef.current &&
        !mobileFilterRef.current.contains(event.target)
      ) {
        setMobileFilterOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  // Disable body scroll when mobile filter is open
  useEffect(() => {
    if (mobileFilterOpen) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "auto";
    }

    return () => {
      document.body.style.overflow = "auto";
    };
  }, [mobileFilterOpen]);

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

  const handleToggleMobileFilter = () => {
    setMobileFilterOpen(!mobileFilterOpen);
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
                <FilterDropdown
                  key={attribute.attribute_name || index}
                  attribute={attribute}
                  index={index}
                  isOpen={isOpen}
                  onToggle={toggleDropDown}
                  onFilterChange={handleFilterChange}
                />
              );
            })}
          </div>
        </div>

        {windowWidth < 712 && (
          <MobileFilters
            sortType={sortType}
            sortTypes={sortTypes}
            selectedOption={selectedOption}
            sortOptions={sortOptions}
            onToggleSort={() => setSortOptions(!sortOptions)}
            onSelectSort={handleSelectSort}
            onToggleFilter={handleToggleMobileFilter}
            t={t}
            mobileSortRef={mobileSortRef}
          />
        )}

        <MobileFilter
          isOpen={mobileFilterOpen && windowWidth < 712}
          onClose={() => setMobileFilterOpen(false)}
          onPriceChange={handlePriceChange}
          formattedFilters={formattedFilters}
          openDropDowns={openDropDowns}
          onToggle={toggleDropDown}
          onFilterChange={handleFilterChange}
          t={t}
        />

        <div className={styles.productsGrid}>
          <Breadcrumb
            parentCategory={subCategories[0]?.parentCategory}
            subCategory={subCategories[0]?.subCategory}
          />
          <div className={styles.subCategoryHeader}>
            <h1 className={styles.subCategoryTitle}>
              {subCategories[0]?.subCategory}
            </h1>

            {windowWidth >= 712 && (
              <SortDropdown
                sortType={sortType}
                sortTypes={sortTypes}
                selectedOption={selectedOption}
                isOpen={sortOptions}
                onToggle={() => setSortOptions(!sortOptions)}
                onSelect={handleSelectSort}
                t={t}
              />
            )}
          </div>

          <div className={styles.mainDiv}>
            <div className={styles.outerDiv}>
              <div className={styles.sliderDiv}>
                {sortedProducts.slice(0, visibleCount).map((product, index) => (
                  <ProductCard key={index} product={product} t={t} />
                ))}
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
