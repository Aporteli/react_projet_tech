import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { ShoppingCart, RefreshCw } from 'lucide-react';
import { useCart } from '../../context/CartContext';
import { useWishlist } from '../../context/WishlistContext';
import { useCompare } from '../../context/CompareContext';
import HeartIconLight from '../../icons/heartIconLight';
import HeartIconFilled from '../../icons/heartIconFilled';
import styles from './singleProduct.module.css';
import { useTranslation } from 'react-i18next';

const BASE_URL = 'http://localhost:5001';

export default function SingleProduct() {
  const { i18n } = useTranslation();
  const { id } = useParams();
  const navigate = useNavigate();
  const { addToCart } = useCart();
  const { toggleWishlist, isInWishlist } = useWishlist();
  const { toggleCompare, isInCompare } = useCompare();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        if (!product) {
          setLoading(true);
        }
        const currentLang = i18n.language ? i18n.language.split('-')[0] : 'en';
        const response = await fetch(`${BASE_URL}/api/products/${id}?lang=${currentLang}`);
        if (!response.ok) {
          throw new Error('Product not found');
        }
        const data = await response.json();
        setProduct(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    if (id) {
      fetchProduct();
    }
  }, [id, i18n.language]);

  const handleAddToCart = () => {
    if (product) {
      addToCart(product);
    }
  };

  const handleWishlistToggle = () => {
    if (product) {
      toggleWishlist(product);
    }
  };

  const handleCompareToggle = () => {
    if (product) {
      toggleCompare(product);
    }
  };

  if (loading) {
    return (
      <div className={styles.container}>
        <div className={styles.loading}>Loading...</div>
      </div>
    );
  }

  if (error || !product) {
    return (
      <div className={styles.container}>
        <div className={styles.error}>
          {error || 'Product not found'}
          <button onClick={() => navigate('/')} className={styles.backButton}>
            Back to Home
          </button>
        </div>
      </div>
    );
  }

  const currentPrice =
    product.discount_price && Number(product.discount_price) < Number(product.price)
      ? Number(product.discount_price)
      : Number(product.price);

  return (
    <div className={styles.container}>
      <div className={styles.productContainer}>
        <div className={styles.imageSection}>
          <img
            src={`${BASE_URL}/uploads/${product.image}`}
            alt={product.name}
            className={styles.mainImage}
          />
        </div>

        <div className={styles.infoSection}>
          <div className={styles.breadcrumb}>
            <span
              onClick={() => navigate(`/category/${product.category_slug}`)}
              className={styles.breadcrumbLink}>
              {product.category_name}
            </span>
            <span className={styles.breadcrumbSeparator}>/</span>
            <span className={styles.breadcrumbCurrent}>{product.name}</span>
          </div>

          <h1 className={styles.productName}>{product.name}</h1>

          <div className={styles.priceSection}>
            <span className={styles.currentPrice}>{currentPrice} ₾</span>
            {product.discount_price && Number(product.discount_price) < Number(product.price) && (
              <span className={styles.oldPrice}>{Number(product.price)} ₾</span>
            )}
          </div>

          {product.short_description && (
            <p className={styles.shortDescription}>{product.short_description}</p>
          )}

          <div className={styles.actionButtons}>
            <button className={styles.wishlistBtn} onClick={handleWishlistToggle}>
              {isInWishlist(product.id) ? <HeartIconFilled /> : <HeartIconLight />}
            </button>
            <button
              className={`${styles.compareBtn} ${isInCompare(product.id) ? styles.compareBtnActive : ''}`}
              onClick={handleCompareToggle}>
              <RefreshCw size={18} />
            </button>
            <button className={styles.addToCartBtn} onClick={handleAddToCart}>
              <ShoppingCart size={18} />
              <span>Add to Cart</span>
            </button>
            <button className={styles.buyNowBtn}>Buy Now</button>
          </div>

          {product.description && (
            <div className={styles.descriptionSection}>
              <h3>Description</h3>
              <p className={styles.description}>{product.description}</p>
            </div>
          )}
        </div>
      </div>

      {product.attributeGroups && product.attributeGroups.length > 0 && (
        <div className={styles.attributesSection}>
          <h2 className={styles.attributesTitle}>Specifications</h2>
          {product.attributeGroups.map(group => (
            <div key={group.id || 'ungrouped'} className={styles.attributeGroup}>
              <h3 className={styles.attributeGroupName}>{group.name}</h3>
              <div className={styles.attributesList}>
                {group.attributes.map(attr => (
                  <div key={attr.id} className={styles.attributeItem}>
                    <span className={styles.attributeName}>{attr.name}</span>
                    <span className={styles.attributeValue}>{attr.value}</span>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
