import { createContext, useContext, useState, useEffect } from 'react';
import { useAuth } from './AuthContext';
import { useTranslation } from 'react-i18next';

const CompareContext = createContext();
const BASE_URL = 'http://localhost:5001';

export const useCompare = () => {
  const context = useContext(CompareContext);
  if (!context) {
    throw new Error('useCompare must be used within a CompareProvider');
  }
  return context;
};

export const CompareProvider = ({ children }) => {
  const [compareItems, setCompareItems] = useState(() => {
    const savedCompare = localStorage.getItem('compare');
    return savedCompare ? JSON.parse(savedCompare) : [];
  });
  const { isAuthenticated } = useAuth();
  const { i18n } = useTranslation();

  console.log(compareItems, 'compareItems');

  // Load compare from localStorage on initial mount (only if authenticated)
  useEffect(() => {
    if (isAuthenticated) {
      const storedCompare = localStorage.getItem('compare');
      if (storedCompare) {
        setCompareItems(JSON.parse(storedCompare));
      }
    }
  }, [isAuthenticated]);

  // Clear compare when user logs out (after being initialized)
  useEffect(() => {
    if (!isAuthenticated) {
      setCompareItems([]);
      localStorage.removeItem('compare');
    }
  }, [isAuthenticated]);

  // Save compare to localStorage whenever it changes (only if authenticated)
  useEffect(() => {
    if (isAuthenticated) {
      localStorage.setItem('compare', JSON.stringify(compareItems));
    }
  }, [compareItems, isAuthenticated]);

  // Refetch products with new language when language changes
  useEffect(() => {
    const refetchProductsWithNewLanguage = async () => {
      if (compareItems.length === 0) return;

      const currentLang = i18n.language.split('-')[0];
      const productIds = compareItems.map(item => item.id || item.product_id).filter(Boolean);

      if (productIds.length === 0) return;

      try {
        const response = await fetch(
          `${BASE_URL}/api/compare/products?ids=${productIds.join(',')}&lang=${currentLang}`
        );

        if (response.ok) {
          const data = await response.json();

          console.log(data, 'განახლებული compareItems');
          setCompareItems(data);
        }
      } catch (error) {
        console.error('Error refetching products with new language:', error);
      }
    };

    refetchProductsWithNewLanguage();
  }, [i18n.language]);

  const addToCompare = product => {
    setCompareItems(prevItems => {
      // Handle both id and product_id from API responses
      const existingItem = prevItems.find(item => String(item.id) === String(product.id));

      if (existingItem) {
        return prevItems;
      }

      // Limit to max 4 products
      if (prevItems.length >= 4) {
        return prevItems;
      }

      // Check if there are existing items and if the new product is from a different category
      if (prevItems.length > 0) {
        const firstItemCategory = prevItems[0].category_id;
        const newProductCategory = product.category_id;

        if (
          firstItemCategory &&
          newProductCategory &&
          String(firstItemCategory) !== String(newProductCategory)
        ) {
          return [{ ...product }];
        }
      }

      // Normalize product object to ensure it has id field
      const normalizedProduct = {
        ...product,
        id: product.id
      };

      return [...prevItems, normalizedProduct];
    });
  };

  const removeFromCompare = productId => {
    setCompareItems(prevItems => prevItems.filter(item => item.id !== productId));
  };

  const isInCompare = productId => {
    return compareItems.some(item => item.id === productId);
  };

  const toggleCompare = product => {
    if (isInCompare(product.id)) {
      removeFromCompare(product.id);
    } else {
      addToCompare(product);
    }
  };

  const clearCompare = () => {
    setCompareItems([]);
  };

  const compareCount = compareItems.length;

  // Get the current category being compared
  const getCompareCategory = () => {
    if (compareItems.length === 0) return null;
    return compareItems[0].category_id;
  };

  return (
    <CompareContext.Provider
      value={{
        compareItems,
        addToCompare,
        removeFromCompare,
        isInCompare,
        toggleCompare,
        clearCompare,
        compareCount,
        getCompareCategory
      }}>
      {children}
    </CompareContext.Provider>
  );
};
