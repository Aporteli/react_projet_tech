import styles from "./home.module.css";
import { useTranslation } from "react-i18next";
import ImageSlider from "../../components/homePageSections/imageSlider";
import GiftSlider from "../../components/homePageSections/giftSlider";
import LogoSlider from "../../components/homePageSections/logoSlider";
import DiscountSlider from "../../components/homePageSections/discountSlider";
import SmallDomesticAppliances from "../../components/homePageSections/smallDomesticAppliances";
import Gaming from "../../components/homePageSections/gaming";
import HomeCategoriesSection from "../../components/homePageSections/homeCategoriesSection";
import mainSliderImg_1 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-1.webp";
import mainSliderImg_2 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-2.webp";
import mainSliderImg_3 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-3.webp";
import mainSliderImg_4 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-4.webp";
import mainSliderImg_5 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-5.webp";
import mainSliderImg_6 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-6.webp";
import mainSliderImg_7 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-7.webp";
import mainSliderImg_8 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-8.webp";
import mainSliderImg_9 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-9.webp";
import mainSliderImg_10 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-10.webp";
import mainSliderImg_11 from "../../assets/pictures/homePagePhotos/mainSliderPhotos/mainSliderImg-11.webp";

import homePagePhoto_1 from "../../assets/pictures/homePagePhotos/mixPhotos/homePagePhoto-1.webp";
import homePagePhoto_2 from "../../assets/pictures/homePagePhotos/mixPhotos/homePagePhoto-2.webp";

const myImages = [
  { url: mainSliderImg_1, alt: "first" },
  { url: mainSliderImg_2, alt: "second" },
  { url: mainSliderImg_3, alt: "third" },
  { url: mainSliderImg_4, alt: "fourth" },
  { url: mainSliderImg_5, alt: "fifth" },
  { url: mainSliderImg_6, alt: "sixth" },
  { url: mainSliderImg_7, alt: "seventh" },
  { url: mainSliderImg_8, alt: "eighth" },
  { url: mainSliderImg_9, alt: "ninth" },
  { url: mainSliderImg_10, alt: "tenth" },
  { url: mainSliderImg_11, alt: "eleventh" },
];

const myImages_1 = [
  {
    url: mainSliderImg_1,
    alt: "Premium Wireless Headphones",
    route: "#",
    name: "Premium Wireless Headphones",
    price: "$199",
    oldPrice: "$249",
    discount: 20,
  },
  {
    url: mainSliderImg_2,
    alt: "Smart Watch Pro",
    route: "#",
    name: "Smart Watch Pro",
    price: "$299",
    oldPrice: "$399",
    discount: 25,
  },
  {
    url: mainSliderImg_3,
    alt: "4K Ultra HD TV",
    route: "#",
    name: "4K Ultra HD TV 55 inch",
    price: "$599",
    oldPrice: "$799",
    discount: 25,
  },
  {
    url: mainSliderImg_4,
    alt: "Gaming Laptop",
    route: "#",
    name: "Gaming Laptop RTX 4060",
    price: "$1299",
    oldPrice: "$1,599",
    discount: 19,
  },
  {
    url: mainSliderImg_5,
    alt: "Wireless Earbuds",
    route: "#",
    name: "Wireless Earbuds Pro",
    price: "$149",
    oldPrice: "$199",
    discount: 25,
  },
  {
    url: mainSliderImg_6,
    alt: "Smart Home Speaker",
    route: "#",
    name: "Smart Home Speaker",
    price: "$99",
    oldPrice: "$129",
    discount: 23,
  },
  {
    url: mainSliderImg_7,
    alt: "Mechanical Keyboard",
    route: "#",
    name: "RGB Mechanical Keyboard",
    price: "$129",
    oldPrice: "$169",
    discount: 24,
  },
  {
    url: mainSliderImg_8,
    alt: "Gaming Mouse",
    route: "#",
    name: "Wireless Gaming Mouse",
    price: "$79",
    oldPrice: "$99",
    discount: 20,
  },
  {
    url: mainSliderImg_9,
    alt: "USB-C Hub",
    route: "#",
    name: "Multi-Port USB-C Hub",
    price: "$49",
    oldPrice: "$69",
    discount: 29,
  },
  {
    url: mainSliderImg_10,
    alt: "Webcam HD",
    route: "#",
    name: "HD Webcam 1080p",
    price: "$89",
    oldPrice: "$119",
    discount: 25,
  },
  {
    url: mainSliderImg_11,
    alt: "Portable SSD",
    route: "#",
    name: "Portable SSD 1TB",
    price: "$159",
    oldPrice: "$199",
    discount: 20,
  },
];

export default function Home() {
  const { t } = useTranslation();

  const smallDomesticAppliancesTitle = t("smallDomesticAppliances.title");
  const smallDomesticAppliancesData = t("smallDomesticAppliances.data", {
    returnObjects: true,
  });
  const gamingTitle = t("gamingCategory.title");
  const gamingData = t("gamingCategory.data", {
    returnObjects: true,
  });

  return (
    <div className={styles.homeWrapper}>
      <div className={styles.mainSection}>
        <ImageSlider images={myImages} />
        <div className={styles.imagesContainer}>
          <div className={styles.imageItem}>
            <img className={styles.image} src={homePagePhoto_1} alt="Image" />
          </div>
          <div className={styles.imageItem}>
            <img className={styles.image} src={homePagePhoto_2} alt="Image" />
          </div>
        </div>

        <HomeCategoriesSection />

        <LogoSlider />
        <DiscountSlider images={myImages_1} />

        <div className={styles.bannerContainer}>
          <img
            className={styles.bannerImage}
            src="https://cdn.pixabay.com/photo/2021/07/15/20/52/gadgets-6469387_1280.jpg"
            alt="Image"
          />
        </div>

        <GiftSlider images={myImages_1} />

        <SmallDomesticAppliances
          title={smallDomesticAppliancesTitle}
          data={smallDomesticAppliancesData}
        />
        <Gaming title={gamingTitle} data={gamingData} />

        <DiscountSlider images={myImages_1} />
      </div>
    </div>
  );
}
