import styles from "./gaming.module.css";
import { useTranslation } from "react-i18next";

export default function Gaming({ title, data }) {
  const { t } = useTranslation();

  const getImageUrl = (path) => {
    return new URL(path, import.meta.url).href;
  };
  return (
    <div className={styles.container}>
      <h3 className={styles.title}>{title}</h3>
      <div className={styles.mainDiv}>
        {data.map((item, index) => (
          <div
            className={`${styles.item} ${styles[`item${index + 1}`]}`}
            key={item.id || index}
          >
            <img
              className={styles.image}
              src={getImageUrl(item.image)}
              alt={item.title || item.name}
            />
          </div>
        ))}
      </div>
    </div>
  );
}
