import { useEffect, useRef, useState } from "react";
import styles from "./discountSlider.module.css";
import HeartIconLight from "../../icons/heartIconLight";
import {
  ChevronLeft,
  ChevronRight,
  ShoppingCart,
  RefreshCw,
} from "lucide-react";
import { Link } from "react-router-dom";
import { useTranslation } from "react-i18next";

export default function DiscountSlider({ images }) {
  const { t } = useTranslation();

  // Ref-ები ImageSlider-ის პრინციპით
  const dragStartX = useRef(0);
  const initialTranslate = useRef(0);
  const dragDelta = useRef(0);
  const wasDraggedForLink = useRef(false);

  const outerDivRef = useRef(null);
  const sliderRef = useRef(null);

  const [imageIndex, setImageIndex] = useState(0);
  const [visibleSlides, setVisibleSlides] = useState(5);
  const [slideWidth, setSlideWidth] = useState(0);
  const [translate, setTranslate] = useState(0);
  const [isDragging, setIsDragging] = useState(false);
  const [isForward, setIsForward] = useState(true);
  const [isPaused, setIsPaused] = useState(false);

  const DRAG_THRESHOLD = 20;
  const GAP = 16;

  // 1. ეკრანის ზომის და სიგანის გამოთვლა (ImageSlider-ის მსგავსად)
  useEffect(() => {
    function updateLayout() {
      if (outerDivRef.current) {
        const containerWidth =
          outerDivRef.current.getBoundingClientRect().width;
        const windowWidth = window.innerWidth;
        let slidesToShow = 5;

        if (windowWidth < 580) {
          slidesToShow = 1;
        } else if (windowWidth < 990) {
          slidesToShow = 2;
        } else if (windowWidth < 1150) {
          slidesToShow = 3;
        } else if (windowWidth < 1350) {
          slidesToShow = 4;
        }

        setVisibleSlides(slidesToShow);
        const totalGapsWidth = GAP * (slidesToShow - 1);
        const newSlideWidth = (containerWidth - totalGapsWidth) / slidesToShow;
        setSlideWidth(newSlideWidth);

        // უსაფრთხო ინდექსი ფანჯრის ზომის შეცვლისას
        const maxIndex = Math.max(0, images.length - slidesToShow);
        const safeIndex = imageIndex > maxIndex ? maxIndex : imageIndex;

        setImageIndex(safeIndex);
        setTranslate(safeIndex * (newSlideWidth + GAP));
      }
    }

    updateLayout();
    window.addEventListener("resize", updateLayout);
    return () => window.removeEventListener("resize", updateLayout);
  }, [images.length, imageIndex]); // updateLayout-ის ლოგიკა გადაკეთდა ზუსტ გათვლებზე

  // 2. ავტომატური სლაიდერი
  useEffect(() => {
    if (isDragging || isPaused) return;
    const interval = setInterval(() => {
      if (isForward) {
        showNextImage();
      } else {
        showPrevImage();
      }
    }, 3000);
    return () => clearInterval(interval);
  });

  // 3. ღილაკების სინქრონული ლოგიკა (ImageSlider-ის პრინციპით)
  const showNextImage = () => {
    const maxIndex = Math.max(0, images.length - visibleSlides);
    if (imageIndex < maxIndex) {
      const newIndex = imageIndex + 1;
      setImageIndex(newIndex);
      setTranslate(newIndex * (slideWidth + GAP));
    } else {
      setIsForward(false);
    }
  };

  const showPrevImage = () => {
    if (imageIndex > 0) {
      const newIndex = imageIndex - 1;
      setImageIndex(newIndex);
      setTranslate(newIndex * (slideWidth + GAP));
    } else {
      setIsForward(true);
    }
  };

  // 4. Drag & Touch ლოგიკა (DragDelta და initialTranslate გამოყენებით)
  const onMouseDown = (e) => {
    setIsDragging(true);
    dragStartX.current = e.clientX;
    initialTranslate.current = translate;
    wasDraggedForLink.current = false;
  };

  const onMouseMove = (e) => {
    if (!isDragging) return;
    const delta = e.clientX - dragStartX.current;
    dragDelta.current = delta;
    setTranslate(initialTranslate.current - delta);

    if (Math.abs(delta) > 5) {
      wasDraggedForLink.current = true;
    }
  };

  const onTouchStart = (e) => {
    setIsDragging(true);
    dragStartX.current = e.touches[0].clientX;
    initialTranslate.current = translate;
    wasDraggedForLink.current = false;
  };

  const onTouchMove = (e) => {
    if (!isDragging) return;
    const delta = e.touches[0].clientX - dragStartX.current;
    dragDelta.current = delta;
    setTranslate(initialTranslate.current - delta);

    if (Math.abs(delta) > 5) {
      wasDraggedForLink.current = true;
    }
  };

  const handleDragEnd = () => {
    if (!isDragging) return;
    setIsDragging(false);

    let newIndex = imageIndex;

    if (dragDelta.current < -DRAG_THRESHOLD) {
      // მარცხნივ გაწევა (შემდეგი)
      const slidesToMove = Math.max(
        1,
        Math.round(Math.abs(dragDelta.current) / slideWidth),
      );
      newIndex = imageIndex + slidesToMove;
    } else if (dragDelta.current > DRAG_THRESHOLD) {
      // მარჯვნივ გაწევა (წინა)
      const slidesToMove = Math.max(
        1,
        Math.round(Math.abs(dragDelta.current) / slideWidth),
      );
      newIndex = imageIndex - slidesToMove;
    }

    const maxIndex = Math.max(0, images.length - visibleSlides);
    if (newIndex < 0) newIndex = 0;
    if (newIndex > maxIndex) newIndex = maxIndex;

    setImageIndex(newIndex);
    setTranslate(newIndex * (slideWidth + GAP));
    dragDelta.current = 0;
  };

  const onMouseUp = () => handleDragEnd();

  const onMouseLeave = () => {
    if (isDragging) {
      handleDragEnd();
    }
    setIsPaused(false);
  };

  const onTouchEnd = () => handleDragEnd();

  const preventImgDrag = (e) => e.preventDefault();
  const handleClick = (e) => {
    if (wasDraggedForLink.current) e.preventDefault();
  };

  return (
    <div
      className={styles.mainDiv}
      onDragStart={preventImgDrag}
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={onMouseLeave}
    >
      <h3 className={styles.title}>{t("discountSlider.title")}</h3>

      <div
        ref={outerDivRef}
        className={styles.outerDiv}
        onMouseDown={onMouseDown}
        onMouseMove={onMouseMove}
        onMouseUp={onMouseUp}
        onTouchStart={onTouchStart}
        onTouchMove={onTouchMove}
        onTouchEnd={onTouchEnd}
        onTouchCancel={() => setIsDragging(false)}
      >
        <div
          ref={sliderRef}
          className={styles.sliderDiv}
          style={{
            transform: `translateX(-${translate}px)`,
            transition: isDragging ? "none" : "transform 0.3s ease-in-out",
          }}
        >
          {images.map(
            ({ url, alt, route, price, oldPrice, discount, name }, index) => (
              <div
                key={index}
                className={styles.flexDiv}
                style={{ flex: `0 0 ${slideWidth}px` }}
              >
                <Link to={route} onClick={handleClick} className={styles.card}>
                  <div className={styles.cardImageContainer}>
                    {discount && (
                      <span className={styles.discountBadge}>-{discount}%</span>
                    )}
                    <div className={styles.buttonsContainer}>
                      <button
                        className={styles.compareBtn}
                        onClick={(e) => e.preventDefault()}
                      >
                        <RefreshCw size={18} />
                      </button>
                      <button className={styles.heartBtn}>
                        <HeartIconLight />
                      </button>
                    </div>
                    <img
                      className={styles.cardImage}
                      src={url}
                      alt={alt}
                      onDragStart={preventImgDrag}
                      loading="lazy"
                    />
                  </div>
                  <div className={styles.cardContent}>
                    <h4 className={styles.productName}>{name || alt}</h4>
                    <div className={styles.priceSection}>
                      <div className={styles.priceContainer}>
                        <span className={styles.currentPrice}>{price}</span>
                        {oldPrice && (
                          <span className={styles.oldPrice}>{oldPrice}</span>
                        )}
                      </div>
                      <div className={styles.perMonthFrom}>
                        {t("discountSlider.perMonthFrom", { price })}
                      </div>
                    </div>
                    <div className={styles.actionButtons}>
                      <button
                        className={styles.addToCartBtn}
                        onClick={(e) => e.preventDefault()}
                      >
                        <ShoppingCart size={20} />
                      </button>
                      <button
                        className={styles.buyNowBtn}
                        onClick={(e) => e.preventDefault()}
                      >
                        {t("discountSlider.buyNow")}
                      </button>
                    </div>
                  </div>
                </Link>
              </div>
            ),
          )}
        </div>

        {/* ღილაკებზე მოვლენის შეჩერება კონფლიქტის ასაცილებლად */}
        <button
          className={`${imageIndex === 0 ? styles.BtnStop : styles.Btn} ${styles.left}`}
          onClick={(e) => {
            e.stopPropagation();
            showPrevImage();
          }}
          onMouseDown={(e) => e.stopPropagation()}
          onTouchStart={(e) => e.stopPropagation()}
        >
          <ChevronLeft size={24} />
        </button>
        <button
          className={`${
            imageIndex >= Math.max(0, images.length - visibleSlides)
              ? styles.BtnStop
              : styles.Btn
          } ${styles.right}`}
          onClick={(e) => {
            e.stopPropagation();
            showNextImage();
          }}
          onMouseDown={(e) => e.stopPropagation()}
          onTouchStart={(e) => e.stopPropagation()}
        >
          <ChevronRight size={24} />
        </button>
      </div>
    </div>
  );
}
