import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Home from './pages/home/home';
import Layout from './Layout';
import Aboutus from './pages/aboutus/aboutus';
import ScrollToTop from './ScrollToTop';
import CategoryPage from './pages/categoryPage/categoryPage';
import SubCategoryPage from './pages/subCategoryPage/subCategoryPage';
import AdminAddProduct from './pages/AdminAddProduct';
import Cart from './pages/cart';
import Wishlist from './pages/wishlist';
import Compare from './pages/compare';
import SearchResults from './pages/searchResults/searchResults';
import User from './pages/user/User';
import SingleProduct from './pages/singleProduct/singleProduct';
import { useAppSync } from './hooks/useAppSync';
import { useAuth } from './context/AuthContext';

function App() {
  const { user } = useAuth();
  useAppSync(user);

  return (
    <div>
      <BrowserRouter>
        <ScrollToTop />
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Home />} />
            <Route path="/aboutus" element={<Aboutus />} />
            <Route path="/category/:slug" element={<CategoryPage />} />
            <Route path="/s/:slug" element={<SubCategoryPage />} />
            <Route path="/admin/add-product" element={<AdminAddProduct />} />
            <Route path="/cart" element={<Cart />} />
            <Route path="/wishlist" element={<Wishlist />} />
            <Route path="/compare" element={<Compare />} />
            <Route path="/search" element={<SearchResults />} />
            <Route path="/user" element={<User />} />
            <Route path="/product/:id" element={<SingleProduct />} />
            <Route
              path="*"
              element={
                <div style={{ padding: '50px', textAlign: 'center' }}>გვერდი ვერ მოიძებნა! ❌</div>
              }
            />
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
