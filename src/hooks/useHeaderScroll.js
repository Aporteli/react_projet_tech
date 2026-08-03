import { useState, useEffect, useRef } from "react";

export const useHeaderScroll = (headerHeight = 80) => {
  const [headerState, setHeaderState] = useState("visible");
  const lastScrollY = useRef(0);

  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;

      if (currentScrollY <= 0) {
        setHeaderState("visible");
        lastScrollY.current = currentScrollY;
        return;
      }

      if (currentScrollY > lastScrollY.current) {
        if (
          currentScrollY > headerHeight &&
          currentScrollY <= headerHeight * 1.5
        ) {
          setHeaderState("hidden");
        } else if (currentScrollY > headerHeight * 1.5) {
          if (headerState !== "sticky") {
            setHeaderState("sticky");
          }
        }
      } else if (currentScrollY < lastScrollY.current) {
        setHeaderState("sticky");
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener("scroll", handleScroll, { passive: true });

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, [headerState, headerHeight]);

  return headerState;
};
