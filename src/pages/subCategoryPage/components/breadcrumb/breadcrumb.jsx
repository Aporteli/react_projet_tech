import { IoIosArrowForward } from "react-icons/io";
import styles from "./breadcrumb.module.css";

export default function Breadcrumb({ parentCategory, subCategory }) {
  return (
    <p className={styles.breadcrumb}>
      Home Page
      <IoIosArrowForward />
      {parentCategory}
      <IoIosArrowForward />
      {subCategory}
    </p>
  );
}
