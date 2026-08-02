import { IoIosArrowForward } from "react-icons/io";
import styles from "./breadcrumb.module.css";

export default function Breadcrumb({ parentCategor, subCategory }) {
  return (
    <p className={styles.breadcrumb}>
      Home Page
      <IoIosArrowForward />
      {parentCategor}
      <IoIosArrowForward />
      {subCategory}
    </p>
  );
}
