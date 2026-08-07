import { Link } from "react-router-dom";
import { GrClearOption } from "react-icons/gr";
import styles from "../Header.module.css";

export default function SearchModal({
  openModal,
  closeModal,
  searchQuery,
  searchResults,
  searchLoading,
  handleSearch,
  handleSearchSubmit,
  clearSearch,
  t,
}) {
  if (!openModal) return null;

  return (
    <div className={styles.modalOverlay} onClick={closeModal}>
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
            onKeyDown={handleSearchSubmit}
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
                onClick={clearSearch}
              >
                <GrClearOption />
                <p className={styles.modalSearchOutputHeaderTitleClear}>
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
                <div className={styles.noResults}>No results found</div>
              )}
            {!searchLoading &&
              searchResults.map((product) => (
                <div className={styles.searchResultItem}>
                  <Link
                    key={product.id}
                    to={`/product/${product.id}`}
                    className={styles.searchResultItemLink}
                    onClick={closeModal}
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
  );
}
