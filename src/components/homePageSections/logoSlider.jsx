import { useRef, useState, useEffect } from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa6";
import styles from "./logoSlider.module.css";
import { Link } from "react-router-dom";
import { useTranslation } from "react-i18next";

import samsung from "../../assets/pictures/homePagePhotos/logoSliderImages/samsung.webp";
import apple from "../../assets/pictures/homePagePhotos/logoSliderImages/apple.webp";
import sony from "../../assets/pictures/homePagePhotos/logoSliderImages/sony.webp";
import lenovo from "../../assets/pictures/homePagePhotos/logoSliderImages/lenovo.webp";
import asus from "../../assets/pictures/homePagePhotos/logoSliderImages/asus.webp";
import lg from "../../assets/pictures/homePagePhotos/logoSliderImages/lg.webp";
import tcl from "../../assets/pictures/homePagePhotos/logoSliderImages/tcl.webp";
import honor from "../../assets/pictures/homePagePhotos/logoSliderImages/honor.webp";
import electrolux from "../../assets/pictures/homePagePhotos/logoSliderImages/electrolux.webp";
import philips from "../../assets/pictures/homePagePhotos/logoSliderImages/philips.webp";
import panasonic from "../../assets/pictures/homePagePhotos/logoSliderImages/panasonic.webp";
import delonghi from "../../assets/pictures/homePagePhotos/logoSliderImages/delonghi.webp";
import toshiba from "../../assets/pictures/homePagePhotos/logoSliderImages/toshiba.webp";
import aeg from "../../assets/pictures/homePagePhotos/logoSliderImages/aeg.webp";
import marley from "../../assets/pictures/homePagePhotos/logoSliderImages/marley.webp";
import tplink from "../../assets/pictures/homePagePhotos/logoSliderImages/tplink.webp";
import sencor from "../../assets/pictures/homePagePhotos/logoSliderImages/sencor.webp";

const logoImages = [
  { src: samsung, alt: "Samsung" },
  { src: apple, alt: "Apple" },
  { src: sony, alt: "Sony" },
  { src: lenovo, alt: "Lenovo" },
  { src: asus, alt: "Asus" },
  { src: lg, alt: "LG" },
  { src: tcl, alt: "TCL" },
  { src: honor, alt: "Honor" },
  { src: electrolux, alt: "Electrolux" },
  { src: philips, alt: "Philips" },
  { src: panasonic, alt: "Panasonic" },
  { src: delonghi, alt: "De'Longhi" },
  { src: toshiba, alt: "Toshiba" },
  { src: aeg, alt: "AEG" },
  { src: marley, alt: "Marley" },
  { src: tplink, alt: "TP-Link" },
  { src: sencor, alt: "Sencor" },
];

export default function LogoSlider() {
  const { t } = useTranslation();
  const sliderRef = useRef(null);
  const velocityRef = useRef(0);
  const animationRef = useRef(null);
  const buttonIntervalRef = useRef(null);

  const [isDragging, setIsDragging] = useState(false);
  const [startX, setStartX] = useState(0);
  const [scrollLeft, setScrollLeft] = useState(0);

  const [isAtStart, setIsAtStart] = useState(true);
  const [isAtEnd, setIsAtEnd] = useState(false);  

  useEffect(() => {isAtEnd
  const slider = sliderRef.current;
  if (!slider) return;

  slider.addEventListener("scroll", checkScrollPosition);
  return () => {
    slider.removeEventListener("scroll", checkScrollPosition);
  };
}, []);

  const checkScrollPosition = () => {
    const slider = sliderRef.current;
    if (!slider) return;

    const { scrollLeft, clientWidth, scrollWidth } = slider;

    // არის თუ არა დასაწყისში (მარცხენა მხარეს)
    setIsAtStart(scrollLeft <= 5);

    // არის თუ არა ბოლოში (მარჯვენა მხარეს) - 5 პიქსელიანი ცდომილების რეზერვით
    setIsAtEnd(scrollLeft + clientWidth >= scrollWidth - 5);
  };

  // --- მთავარი ანიმაციის ციკლი (სრიალი და შენელება) ---
  const animateScroll = () => {
    const slider = sliderRef.current;
    if (!slider) return;

    if (Math.abs(velocityRef.current) < 0.1) {
      velocityRef.current = 0;
      checkScrollPosition();
      return;
    }
    slider.scrollLeft += velocityRef.current;
    if (!buttonIntervalRef.current) {
      velocityRef.current *= 0.94;
      checkScrollPosition();
    }

    animationRef.current = requestAnimationFrame(animateScroll);
  };

  // ანიმაციის უსაფრთხო დაწყება
  const startAnimation = () => {
    if (animationRef.current) cancelAnimationFrame(animationRef.current);
    animationRef.current = requestAnimationFrame(animateScroll);
  };

  // --- მაუსის რგოლით (Wheel) სქროლვა ---
  useEffect(() => {
    const slider = sliderRef.current;
    if (!slider) return;

    const handleWheel = (e) => {
      e.preventDefault();
      velocityRef.current += e.deltaY * 0.05;
      startAnimation();
    };

    slider.addEventListener("wheel", handleWheel, { passive: false });

    return () => {
      slider.removeEventListener("wheel", handleWheel);
      if (animationRef.current) cancelAnimationFrame(animationRef.current);
      if (buttonIntervalRef.current) clearInterval(buttonIntervalRef.current);
    };
  }, []);

  // --- ისრებზე დაჭერის (Hold და Click) ახალი ლოგიკა ---
  const handleArrowPress = (direction) => {
    if (buttonIntervalRef.current) clearInterval(buttonIntervalRef.current);
    const speedStep = direction === "left" ? -2 : 2;
    const initialImpulse = direction === "left" ? -10 : 10;
    velocityRef.current = initialImpulse;
    startAnimation();
    buttonIntervalRef.current = setInterval(() => {
      velocityRef.current = speedStep * 3;
    }, 50);
  };

  const handleArrowRelease = () => {
    // როგორც კი ღილაკს ხელს ავუშვებთ, ინტერვალს ვთიშავთ
    if (buttonIntervalRef.current) {
      clearInterval(buttonIntervalRef.current);
      buttonIntervalRef.current = null;
    }
  };

  // --- მაუსით/თითით გაწევის (Drag) ლოგიკა ---
  const handleMouseDown = (e) => {
    velocityRef.current = 0;
    if (animationRef.current) cancelAnimationFrame(animationRef.current);

    setIsDragging(true);
    setStartX(e.pageX - sliderRef.current.offsetLeft);
    setScrollLeft(sliderRef.current.scrollLeft);
  };

  const handleMouseLeave = () => {
    setIsDragging(false);
    handleArrowRelease();
  };

  const handleMouseUp = () => {
    setIsDragging(false);
    handleArrowRelease();
  };

  const handleMouseMove = (e) => {
    if (!isDragging) return;
    e.preventDefault();
    const x = e.pageX - sliderRef.current.offsetLeft;
    const walk = x - startX;
    sliderRef.current.scrollLeft = scrollLeft - walk;
    checkScrollPosition();
  };

  return (
    <div className={styles.headerWrapper}>
      <div className={styles.sliderWrapper}>
        <h2 className={styles.brandsTitle}>{t("brands.title")}</h2>
        <div className={styles.arraws_slider}>
          <div className={styles.buttonsContainer}>
            <button
              className={`${styles.arrowBtn} ${styles.left} ${isAtStart ? styles.disabled : ""}`}
              onMouseDown={() => handleArrowPress("left")}
              onMouseUp={handleArrowRelease}
              onMouseLeave={handleArrowRelease}
              onTouchStart={() => handleArrowPress("left")}
              onTouchEnd={handleArrowRelease}
            >
              <FaChevronLeft />
            </button>

            <button
              className={`${styles.arrowBtn} ${styles.right} ${isAtEnd ? styles.disabled : ""}`}
              onMouseDown={() => handleArrowPress("right")}
              onMouseUp={handleArrowRelease}
              onMouseLeave={handleArrowRelease}
              onTouchStart={() => handleArrowPress("right")}
              onTouchEnd={handleArrowRelease}
            >
              <FaChevronRight />
            </button>
          </div>
          <div
            className={styles.sliderContainer}
            ref={sliderRef}
            onMouseDown={handleMouseDown}
            onMouseLeave={handleMouseLeave}
            onMouseUp={handleMouseUp}
            onMouseMove={handleMouseMove}
          >
            {logoImages.map(({ src, alt }, index) => (
              <div className={styles.categoryItemInner} key={index}>
                <Link draggable="false" className={styles.logoLink} to="#">
                  <img
                    className={styles.logoImage}
                    src={src}
                    alt={alt}
                    draggable="false"
                  />
                </Link>
              </div>
            ))}
          </div>

          {/* მარჯვენა ისარი */}
        </div>
      </div>
    </div>
  );
}
