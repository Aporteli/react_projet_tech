import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import { IoIosArrowDown } from "react-icons/io";
import styles from "./filterDropdown.module.css";

export default function FilterDropdown({
  attribute,
  index,
  isOpen,
  onToggle,
  onFilterChange,
}) {
  return (
    <div
      key={attribute.attribute_name || index}
      className={`${styles.filterGridDropDownItem} ${
        styles[`filterGridDropDownItem${index}`]
      }`}
      onClick={() => onToggle(index)}
    >
      <div className={styles.filterGridDropDownItemContent}>
        <p className={styles.filterGridDropDownItemName}>
          {attribute.attribute_name}
        </p>
        <IoIosArrowDown />
      </div>

      <OverlayScrollbarsComponent
        element="div"
        options={{
          scrollbars: {
            autoHide: "leave",
            theme: "os-theme-dark",
          },
        }}
        className={`${styles.filterGridDropDownItemList} ${
          isOpen ? styles.filterGridDropDownItemListActive : ""
        }`}
        onClick={(e) => e.stopPropagation()}
      >
        {attribute.options && attribute.options.length > 0 ? (
          attribute.options.map((option, optIndex) => {
            const optValue =
              typeof option === "object"
                ? option.id || option.name
                : option;
            const optLabel =
              typeof option === "object" ? option.name : option;

            return (
              <label
                key={optIndex}
                className={styles.filterCheckboxItem}
              >
                <input
                  type="checkbox"
                  value={optValue}
                  onChange={(e) =>
                    onFilterChange(
                      attribute.attribute_name,
                      optValue,
                      e.target.checked,
                    )
                  }
                />
                <span>{optLabel}</span>
              </label>
            );
          })
        ) : (
          <p>მონაცემები არ არის</p>
        )}
      </OverlayScrollbarsComponent>
    </div>
  );
}
