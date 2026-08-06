import { createContext, useContext, useState, useEffect } from 'react';
import { useAuth } from './AuthContext';

const CompareContext = createContext();

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

  const addToCompare = product => {
    setCompareItems(prevItems => {
      const existingItem = prevItems.find(item => item.id === product.id);
      if (existingItem) {
        return prevItems;
      }

      // Limit to max 4 products
      if (prevItems.length >= 4 && product.category_id === prevItems[0].category_id) {
        return prevItems;
      }

      // Check if there are existing items and if the new product is from a different category
      if (prevItems.length > 0) {
        const firstItemCategory = prevItems[0].category_id;
        const newProductCategory = product.category_id;

        if (firstItemCategory !== newProductCategory) {
          // Clear existing items and add the new product from different category
          return [{ ...product }];
        }
      }

      return [...prevItems, { ...product }];
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
