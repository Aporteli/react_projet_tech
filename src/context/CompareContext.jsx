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

  // Save compare to localStorage whenever it changes (only if authenticated)
  useEffect(() => {
    localStorage.setItem('compare', JSON.stringify(compareItems));
  }, [compareItems]);

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

  // ბექენდიდან კონკრეტული პროდუქტის წამოღების დამხმარე ფუნქცია
  const fetchProductDetails = async productId => {
    const currentLang = i18n.language.split('-')[0];
    try {
      const response = await fetch(
        `${BASE_URL}/api/compare/products?ids=${productId}&lang=${currentLang}`
      );
      if (response.ok) {
        const data = await response.json();
        return data[0]; // აბრუნებს წამოღებულ პროდუქტს
      }
    } catch (error) {
      console.error('Error fetching product details:', error);
    }
    return null;
  };

  const addToCompare = async product => {
    const productId = product.id || product.product_id;

    // 1. თუ უკვე არის სიაში, არ დაამატოს
    if (isInCompare(productId)) return;

    // 2. თუ ლიმიტი (4 პროდუქტი) შევსებულია, არ დაამატოს
    if (compareItems.length >= 4) return;

    // 3. წამოიღოს განახლებული პროდუქტი ბექენდიდან მიმდინარე ენით
    const fetchedProduct = await fetchProductDetails(productId);
    const newProduct = fetchedProduct || product;

    setCompareItems(prevItems => {
      // Check if there are existing items and if the new product is from a different category
      if (prevItems.length > 0) {
        const firstItemCategory = prevItems[0].category_id;
        const newProductCategory = newProduct.category_id;

        if (
          firstItemCategory &&
          newProductCategory &&
          String(firstItemCategory) !== String(newProductCategory)
        ) {
          return [{ ...newProduct }];
        }
      }

      // Normalize product object to ensure it has id field
      const normalizedProduct = {
        ...newProduct,
        id: newProduct.id || productId
      };

      return [...prevItems, normalizedProduct];
    });
  };

  const removeFromCompare = productId => {
    setCompareItems(prevItems =>
      prevItems.filter(item => (item.id || item.product_id) !== productId)
    );
  };

  const isInCompare = productId => {
    return compareItems.some(item => (item.id || item.product_id) === productId);
  };

  const toggleCompare = async product => {
    const productId = product.id || product.product_id;

    if (isInCompare(productId)) {
      removeFromCompare(productId);
    } else {
      await addToCompare(product);
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
