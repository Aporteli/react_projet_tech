import styles from './compare.module.css';
import { useTranslation } from 'react-i18next';
import { useCompare } from '../context/CompareContext';
import { Link } from 'react-router-dom';
import { useState, useEffect } from 'react';
import CompareSearchModal from '../components/compareSearchModal/compareSearchModal';
import { fetchSubCateogryCompareScreenAttributes } from '../api/categoryService';

const BASE_URL = 'http://localhost:5001';

export default function Compare() {
  const { t } = useTranslation();
  const { compareItems, removeFromCompare, clearCompare, toggleCompare, getCompareCategory } =
    useCompare();
  const [isSearchModalOpen, setIsSearchModalOpen] = useState(false);
  const [attributes, setAttributes] = useState(null);
  const { i18n } = useTranslation();

  // Fetch attributes based on category
  useEffect(() => {
    const category = getCompareCategory();
    if (category) {
      fetchSubCateogryCompareScreenAttributes(category, i18n.language.split('-')[0])
        .then(data => {
          setAttributes(data);
        })
        .catch(err => console.error(err));
    }
  }, [getCompareCategory, i18n.language]);

  console.log(attributes, 'attributes');

  const handleAddProduct = product => {
    toggleCompare(product);
  };

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>{t('compare.title') || 'Compare Products'}</h1>
        {compareItems.length > 0 && (
          <button className={styles.clearButton} onClick={clearCompare}>
            {t('compare.clear') || 'Clear All'}
          </button>
        )}
      </div>

      <div className={styles.content}>
        {compareItems.length === 0 ? (
          <div className={styles.emptyCompare}>
            <div className={styles.emptyIcon}>
              <svg
                width="120"
                height="120"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="1">
                <path d="M9 17h6" />
                <path d="M9 13h6" />
                <path d="M9 9h6" />
                <rect x="3" y="3" width="18" height="18" rx="2" />
              </svg>
            </div>
            <p className={styles.emptyMessage}>{t('compare.empty') || 'No products to compare'}</p>
            <button className={styles.addProductButton} onClick={() => setIsSearchModalOpen(true)}>
              {t('compare.addProduct') || 'Add Product to Compare'}
            </button>
          </div>
        ) : (
          <div className={styles.compareTableContainer}>
            <table className={styles.compareTable}>
              <tbody>
                {/* Product images row */}
                <tr className={styles.imageRow}>
                  <td className={styles.attributeCell}>
                    <span className={styles.attributeLabel}>
                      {t('compare.product') || 'Product'}
                    </span>
                  </td>
                  {compareItems.map((product, index) => (
                    <td key={`empty_1${index}`} className={styles.productCell}>
                      <div className={styles.productImageContainer}>
                        <button
                          className={styles.removeProductButton}
                          onClick={() => removeFromCompare(product.id)}>
                          ×
                        </button>
                        <img
                          src={`${BASE_URL}/uploads/${product.image}`}
                          alt={product.name}
                          className={styles.productImage}
                        />
                      </div>
                      <h3 className={styles.productName}>{product.name}</h3>
                    </td>
                  ))}
                  {/* Fill empty cells to maintain 4 columns max */}
                  {Array.from({ length: 4 - compareItems.length }).map((_, index) => (
                    <td key={`empty-price-12${index}`} className={styles.emptyCell}>
                      <button
                        className={styles.addMoreButton}
                        onClick={() => setIsSearchModalOpen(true)}>
                        +
                      </button>
                    </td>
                  ))}
                </tr>

                {/* Price row */}
                <tr className={styles.dataRow}>
                  <td className={styles.attributeCell}>
                    <span className={styles.attributeLabel}>{t('compare.price') || 'Price'}</span>
                  </td>
                  {compareItems.map((product, index) => (
                    <td key={`price-${index}`} className={styles.productCell}>
                      <div className={styles.productPrice}>
                        {product.discount_price &&
                        Number(product.discount_price) < Number(product.price) ? (
                          <>
                            <span className={styles.currentPrice}>{product.discount_price} ₾</span>
                            <span className={styles.oldPrice}>{product.price} ₾</span>
                          </>
                        ) : (
                          <span className={styles.currentPrice}>{product.price} ₾</span>
                        )}
                      </div>
                    </td>
                  ))}
                  {Array.from({ length: 4 - compareItems.length }).map((_, index) => (
                    <td key={`empty-price-${index}`} className={styles.emptyCell}></td>
                  ))}
                </tr>

                {/* Dynamic attributes rows */}
                {attributes?.attributes &&
                  attributes.attributes.map((attribute, attrIndex) => (
                    <tr key={`attr-row-${attribute}-${attrIndex}`} className={styles.dataRow}>
                      <td className={styles.attributeCell}>
                        <span className={styles.attributeLabel}>{attribute}</span>
                      </td>

                      {/* 🟢 თითოეული შედარებული პროდუქტისთვის ვებუტებთ 1 ცალ <td>-ს */}
                      {compareItems.map((product, prodIndex) => {
                        // ვპოულობთ ამ პროდუქტის ატრიბუტებში იმას, რომლის სახელიც ემთხვევა მიმდინარე ატრიბუტს
                        const matchedAttr = product.attributes?.find(
                          item => item.attribute_name === attribute
                        );

                        return (
                          <td
                            key={`cell-${product.product_id || product.id}-${attrIndex}-${prodIndex}`}
                            className={styles.productCell}>
                            <span className={styles.attributeValue}>
                              {matchedAttr ? matchedAttr.attribute_value : '-'}
                            </span>
                          </td>
                        );
                      })}

                      {/* ცარიელი უჯრები შევსებისთვის */}
                      {Array.from({ length: 4 - compareItems.length }).map((_, emptyIndex) => (
                        <td
                          key={`empty-${attribute}-${emptyIndex}`}
                          className={styles.emptyCell}></td>
                      ))}
                    </tr>
                  ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      <CompareSearchModal
        isOpen={isSearchModalOpen}
        onClose={() => setIsSearchModalOpen(false)}
        onProductSelect={handleAddProduct}
        currentCategory={getCompareCategory()}
      />
    </div>
  );
}
