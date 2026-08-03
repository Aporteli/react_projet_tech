import styles from "../Header.module.css";

export default function LanguageSwitcher({
  currentLanguage,
  lengDropdownOpen,
  toggleLanguageDropdown,
  changeLanguage,
  variant = "desktop",
}) {
  const isDesktop = variant === "desktop";

  return (
    <div
      className={
        isDesktop
          ? styles.languageContainer
          : styles.tabletLanguageContainer
      }
    >
      <button
        className={
          isDesktop ? styles.languageButton : styles.tabletLanguageButton
        }
        onClick={toggleLanguageDropdown}
      >
        {currentLanguage === "en" ? "ENG" : "RUS"}
      </button>

      <button
        className={`${
          isDesktop
            ? styles.languageDropdownButton
            : styles.tabletLanguageDropdownButton
        } ${
          lengDropdownOpen
            ? isDesktop
              ? styles.languageDropdownButtonOpen
              : styles.tabletLanguageDropdownButtonOpen
            : ""
        }`}
        onClick={() => {
          changeLanguage(currentLanguage === "en" ? "ru" : "en");
          toggleLanguageDropdown();
        }}
      >
        {currentLanguage === "en" ? "RUS" : "ENG"}
      </button>
    </div>
  );
}
