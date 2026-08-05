import { useState } from 'react';
import { Search, X } from 'lucide-react';
import styles from './compareSearchModal.module.css';
import { useTranslation } from 'react-i18next';

const BASE_URL = 'http://localhost:5001';

export default function CompareSearchModal({ isOpen, onClose, onProductSelect, currentCategory }) {
  const { i18n, t } = useTranslation();
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const handleSearch = async query => {
    setSearchQuery(query);

    if (query.length < 2) {
      setSearchResults([]);
      return;
    }

    setIsLoading(true);
    try {
      const categoryParam = currentCategory ? `&category=${currentCategory}` : '';

      const response = await fetch(
        `${BASE_URL}/api/compare/search?q=${encodeURIComponent(query)}&lang=${i18n.language.split('-')[0]}${categoryParam}`
      );
      const data = await response.json();
      if (response.ok) {
        setSearchResults(data);
      }
    } catch (error) {
      console.error('Search error:', error);
      setSearchResults([]);
    } finally {
      setIsLoading(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div className={styles.overlay} onClick={onClose}>
      <div className={styles.modal} onClick={e => e.stopPropagation()}>
        <button className={styles.closeButton} onClick={onClose}>
          <X size={20} />
        </button>

        <div className={styles.searchContainer}>
          <Search className={styles.searchIcon} size={20} />
          <input
            type="text"
            className={styles.searchInput}
            placeholder={t('compare.searchPlaceholder') || 'Search products...'}
            value={searchQuery}
            onChange={e => handleSearch(e.target.value)}
            autoFocus
          />
        </div>

        <div className={styles.resultsContainer}>
          {isLoading ? (
            <div className={styles.loading}>Loading...</div>
          ) : searchResults.length > 0 ? (
            <div className={styles.resultsList}>
              {searchResults.map(product => (
                <div
                  key={product.id}
                  className={styles.resultItem}
                  onClick={() => {
                    onProductSelect(product);
                    onClose();
                    setSearchQuery('');
                    setSearchResults([]);
                  }}>
                  <img src={`${BASE_URL}/uploads/${product.image}`} alt={product.name} className={styles.resultImage} />
                  <div className={styles.resultInfo}>
                    <h4 className={styles.resultName}>{product.name}</h4>
                    <p className={styles.resultPrice}>
                      {product.discount_price && Number(product.discount_price) < Number(product.price)
                        ? `${product.discount_price} ₾`
                        : `${product.price} ₾`}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          ) : searchQuery.length >= 2 ? (
            <div className={styles.noResults}>{t('compare.noResults') || 'No products found'}</div>
          ) : null}
        </div>
      </div>
    </div>
  );
}
