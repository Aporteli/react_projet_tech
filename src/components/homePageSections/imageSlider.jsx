import { useEffect, useRef, useState } from "react";
import styles from "./imageSlider.module.css";

export default function ImageSlider({
  images = [],
  gap = 5,
  customClasses = {},
}) {
  const dragStartX = useRef(0);
  const initialTranslate = useRef(0);
  const dragDelta = useRef(0);
  const sectionRef = useRef(null);
  const [imageIndex, setImageIndex] = useState(0);
  const [translate, setTranslate] = useState(0);
  const [slideWidth, setSlideWidth] = useState(0);
  const [isDragging, setIsDragging] = useState(false);

  // დრაგის მგრძნობელობა პიქსელებში
  const DRAG_THRESHOLD = 20;

  useEffect(() => {
    function updateWidth() {
      if (sectionRef.current) {
        const containerWidth = sectionRef.current.getBoundingClientRect().width;
        setSlideWidth(containerWidth);
        setTranslate(imageIndex * (containerWidth + gap));
      }
    }

    updateWidth();
    window.addEventListener("resize", updateWidth);
    return () => window.removeEventListener("resize", updateWidth);
  }, [imageIndex, gap]);

  const onMouseDown = (e) => {
    setIsDragging(true);
    dragStartX.current = e.clientX;
    initialTranslate.current = translate;
  };

  const onMouseMove = (e) => {
    if (!isDragging) return;
    const delta = e.clientX - dragStartX.current;
    dragDelta.current = delta;
    setTranslate(initialTranslate.current - delta);
  };

  const onMouseUp = () => {
    if (!isDragging) return;
    setIsDragging(false);
    let newIndex = imageIndex;

    if (dragDelta.current < -DRAG_THRESHOLD && imageIndex < images.length - 1) {
      newIndex = imageIndex + 1;
    } else if (dragDelta.current > DRAG_THRESHOLD && imageIndex > 0) {
      newIndex = imageIndex - 1;
    }

    setImageIndex(newIndex);
    setTranslate(newIndex * (slideWidth + gap));
    dragDelta.current = 0;
  };

  const onMouseLeave = () => {
    if (isDragging) onMouseUp();
  };

  const showNextImage = () => {
    if (imageIndex < images.length - 1) {
      const newIndex = imageIndex + 1;
      setImageIndex(newIndex);
      setTranslate(newIndex * (slideWidth + gap));
    }
  };

  const showPrevImage = () => {
    if (imageIndex > 0) {
      const newIndex = imageIndex - 1;
      setImageIndex(newIndex);
      setTranslate(newIndex * (slideWidth + gap));
    }
  };

  const goToSlide = (index) => {
    setImageIndex(index);
    setTranslate(index * (slideWidth + gap));
  };

  const preventImgDrag = (e) => e.preventDefault();

  if (!images || images.length === 0) return null;

  return (
    <section
      className={`${styles.section} ${customClasses.section || ""}`}
      aria-label="Image Slider"
    >
      <div
        className={`${styles.outerDiv} ${customClasses.outerDiv || ""}`}
        ref={sectionRef}
      >
        <div
          className={`${styles.sliderDiv} ${customClasses.sliderDiv || ""}`}
          style={{
            transform: `translateX(-${translate}px)`,
            transition: isDragging ? "none" : "transform 0.3s ease-in-out",
            gap: `${gap}px`,
          }}
          onMouseDown={onMouseDown}
          onMouseMove={onMouseMove}
          onMouseUp={onMouseUp}
          onMouseLeave={onMouseLeave}
        >
          {images.map(({ url, alt }, index) => (
            <div
              key={index}
              className={`${styles.imageContainer} ${customClasses.imageContainer || ""}`}
            >
              <img
                src={url}
                alt={alt || `Slide ${index + 1}`}
                aria-hidden={imageIndex !== index}
                className={`${styles.imgSliderImg} ${customClasses.img || ""}`}
                onDragStart={preventImgDrag}
                loading="lazy"
              />
              <div
                className={`${styles.divOnImage} ${customClasses.overlay || ""}`}
              />
            </div>
          ))}
        </div>
      </div>
      <div
        className={`${styles.dotsContainer} ${customClasses.dotsContainer || ""}`}
      >
        {images.map((_, index) => (
          <button
            key={index}
            className={`${styles.dot} ${imageIndex === index ? styles.dotActive : ""} ${customClasses.dot || ""}`}
            onClick={() => goToSlide(index)}
            aria-label={`Go to slide ${index + 1}`}
            aria-current={imageIndex === index}
          />
        ))}
      </div>
    </section>
  );
}
