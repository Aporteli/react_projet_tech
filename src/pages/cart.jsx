import styles from "./cart.module.css";
import { useTranslation } from "react-i18next";
import { useCart } from "../context/CartContext";
import { Link } from "react-router-dom";
import { Trash2, Plus, Minus } from "lucide-react";
import emptyCartImage from "../assets/pictures/cartToolTipPhoto.webp";

const BASE_URL = "http://localhost:5001";

export default function Cart() {
  const { t } = useTranslation();
  const { cartItems, removeFromCart, updateQuantity, cartTotal } = useCart();

  const handleQuantityChange = (productId, newQuantity) => {
    updateQuantity(productId, newQuantity);
  };

  if (cartItems.length === 0) {
    return (
      <div className={styles.container}>
        <div className={styles.header}>
          <h1 className={styles.title}>{t("cart.title") || "Shopping Cart"}</h1>
        </div>
        <div className={styles.content}>
          <div className={styles.emptyCart}>
            <p className={styles.emptyMessage}>
              {t("cart.empty") || "Your cart is empty"}
            </p>
            <img
              className={styles.emptyCartImage}
              src={emptyCartImage}
              alt="Empty cart"
            />
            <Link to="/" className={styles.continueShopping}>
              {t("cart.continueShopping") || "Continue Shopping"}
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h1 className={styles.title}>{t("cart.title") || "Shopping Cart"}</h1>
      </div>
      <div className={styles.content}>
        <div className={styles.cartItems}>
          {cartItems.map((item) => {
            const currentPrice =
              Number(item.discountPrice) &&
              Number(item.discountPrice) < Number(item.price)
                ? Number(item.discountPrice)
                : Number(item.price);
            return (
              <div key={item.id} className={styles.cartItem}>
                <img
                  className={styles.itemImage}
                  src={`${BASE_URL}/uploads/${item.image}`}
                  alt={item.name}
                />
                <div className={styles.itemDetails}>
                  <h3 className={styles.itemName}>{item.name}</h3>
                  <p className={styles.itemPrice}>
                    {currentPrice} ₾
                    {item.discountPrice &&
                      Number(item.discountPrice) < Number(item.price) && (
                        <span className={styles.oldPrice}>
                          {Number(item.price)} ₾
                        </span>
                      )}
                  </p>
                </div>
                <div className={styles.itemActions}>
                  <div className={styles.quantityControl}>
                    <button
                      className={styles.quantityButton}
                      onClick={() =>
                        handleQuantityChange(item.id, item.quantity - 1)
                      }
                    >
                      <Minus size={16} />
                    </button>
                    <span className={styles.quantity}>{item.quantity}</span>
                    <button
                      className={styles.quantityButton}
                      onClick={() =>
                        handleQuantityChange(item.id, item.quantity + 1)
                      }
                    >
                      <Plus size={16} />
                    </button>
                  </div>
                  <button
                    className={styles.removeButton}
                    onClick={() => removeFromCart(item.id)}
                  >
                    <Trash2 size={18} />
                  </button>
                </div>
              </div>
            );
          })}
        </div>
        <div className={styles.cartSummary}>
          <div className={styles.summaryRow}>
            <span className={styles.summaryLabel}>
              {t("cart.subtotal") || "Subtotal"}
            </span>
            <span className={styles.summaryValue}>
              {cartTotal.toFixed(2)} ₾
            </span>
          </div>
          <button className={styles.checkoutButton}>
            {t("cart.checkout") || "Proceed to Checkout"}
          </button>
        </div>
      </div>
    </div>
  );
}
