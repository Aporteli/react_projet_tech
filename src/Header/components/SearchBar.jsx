import SearchIcon from "../../icons/searchIcon.jsx";
import styles from "../Header.module.css";

export default function SearchBar({
  searchQuery,
  handleSearch,
  openModal,
  openModalHandler,
  t,
}) {
  return (
    <div
      className={`${styles.searchBar} ${openModal ? styles.searchBarOpen : ""}`}
    >
      <input
        onClick={openModalHandler}
        className={styles.searchInput}
        type="text"
        placeholder={t("header.searchPlaceholder")}
        value={searchQuery}
        onChange={(e) => handleSearch(e.target.value)}
      />
      <SearchIcon />
    </div>
  );
}
