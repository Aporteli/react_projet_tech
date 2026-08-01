import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "./pages/home/home";
import Layout from "./Layout";
import Aboutus from "./pages/aboutus/aboutus";
import ScrollToTop from "./ScrollToTop";
import CategoryPage from "./pages/categoryPage/categoryPage";
import SubCategoryPage from "./pages/subCategoryPage/subCategoryPage";
import AdminAddProduct from "./pages/AdminAddProduct";
function App() {
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
            <Route
              path="*"
              element={
                <div style={{ padding: "50px", textAlign: "center" }}>
                  გვერდი ვერ მოიძებნა! ❌
                </div>
              }
            />
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
