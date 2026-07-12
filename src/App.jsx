import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "./home";
import Layout from "./Layout";
import Aboutus from "./aboutus";
import ScrollToTop from "./ScrollToTop";


function App() {
  return (
      <div>
        <BrowserRouter>
          <ScrollToTop />
          <Routes>
            <Route path="/" element={<Layout />}>
              <Route index element={<Home />} />
              <Route path="aboutus" element={<Aboutus />} />
            </Route>
          </Routes>
        </BrowserRouter>
      </div>
  );
}

export default App;
