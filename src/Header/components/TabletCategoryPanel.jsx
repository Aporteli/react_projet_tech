import { useEffect } from "react";
import { FaX } from "react-icons/fa6";
import CategoriesDropdown from "../../components/categoriesDropdown.jsx";
import styles from "../Header.module.css";

export default function TabletCategoryPanel({ categoryOpen, setCategoryOpen }) {
  useEffect(() => {
    if (categoryOpen) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "unset";
    }

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
  }, [categoryOpen, setCategoryOpen]);

  if (!categoryOpen) return null;

  return (
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
  );
}
