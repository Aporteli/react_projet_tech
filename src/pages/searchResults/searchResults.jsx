import { useState, useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import styles from './searchResults.module.css';
import { useTranslation } from 'react-i18next';
import HeartIconLight from '../../icons/heartIconLight';
import HeartIconFilled from '../../icons/heartIconFilled';
import { ShoppingCart, RefreshCw } from 'lucide-react';
import { useCart } from '../../context/CartContext';
import { useWishlist } from '../../context/WishlistContext';

function SearchResults() {
  const { t, i18n } = useTranslation();
  const { addToCart } = useCart();
  const { toggleWishlist, isInWishlist } = useWishlist();
  const [searchParams] = useSearchParams();
  const query = searchParams.get('q') || '';
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchSearchResults = async () => {
      if (!query || query.trim().length < 2) {
        setProducts([]);
        setLoading(false);
        return;
      }

      setLoading(true);
      setError(null);
      try {
        const response = await fetch(
          `http://localhost:5001/api/search?q=${encodeURIComponent(query)}&lang=${i18n.language.split('-')[0]}`
        );
        const data = await response.json();
        setProducts(data);
      } catch (err) {
        console.error('Search error:', err);
        setError('Failed to fetch search results');
        setProducts([]);
      } finally {
        setLoading(false);
      }
    };

    fetchSearchResults();
  }, [query, i18n.language]);

  const handleAddToCart = (product, e) => {
    e.preventDefault();
    addToCart(product);
  };

  const handleWishlistToggle = (product, e) => {
    e.preventDefault();
    toggleWishlist(product);
  };

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>
          {t('searchResults.title')}: "{query}"
        </h1>
        <p className={styles.resultsCount}>
          {loading ? (
            t('searchResults.loading')
          ) : (
            <>
              {products.length} {t('searchResults.resultsFound')}
            </>
          )}
        </p>
      </div>

      {loading && (
        <div className={styles.loadingContainer}>
          <div className={styles.spinner}></div>
          <p>{t('searchResults.loading')}</p>
        </div>
      )}

      {!loading && error && (
        <div className={styles.errorContainer}>
          <p>{error}</p>
        </div>
      )}

      {!loading && !error && products.length === 0 && (
        <div className={styles.noResults}>
          <p>{t('searchResults.noResults')}</p>
          <Link to="/" className={styles.backLink}>
            {t('searchResults.backToHome')}
          </Link>
        </div>
      )}

      {!loading && !error && products.length > 0 && (
        <div className={styles.productsGrid}>
          {products.map(product => (
            <div key={product.id} className={styles.productCard}>
              <Link to={`/product/${product.slug}`} className={styles.productCardLink}>
                <div className={styles.productImageContainer}>
                  <div className={styles.buttonsContainer}>
                    <button className={styles.compareBtn} onClick={e => e.preventDefault()}>
                      <RefreshCw size={18} />
                    </button>
                    <button className={styles.heartBtn} onClick={e => handleWishlistToggle(product, e)}>
                      {isInWishlist(product.id) ? <HeartIconFilled /> : <HeartIconLight />}
                    </button>
                  </div>
                  <img
                    src={`http://localhost:5001/uploads/${product.image}`}
                    alt={product.name}
                    className={styles.productImage}
                  />
                </div>
                <div className={styles.productInfo}>
                  <h3 className={styles.productName}>{product.name}</h3>
                  <p className={styles.productPrice}>
                    {product.discount_price ? product.discount_price : product.price} ₾
                  </p>
                  {product.discount_price && <p className={styles.originalPrice}>{product.price} ₾</p>}
                  <div className={styles.actionButtons}>
                    <button className={styles.addToCartBtn} onClick={e => handleAddToCart(product, e)}>
                      <ShoppingCart size={15} />
                    </button>
                    <button className={styles.buyNowBtn} onClick={e => e.preventDefault()}>
                      {t('discountSlider.buyNow')}
                    </button>
                  </div>
                </div>
              </Link>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default SearchResults;
