import React, { useState, useEffect, useRef } from 'react';
import styles from './Header.module.css'; // შემოგვაქვს როგორც ობიექტი

const Header = () => {
  const [headerState, setHeaderState] = useState('visible');
  const lastScrollY = useRef(0);
  const headerHeight = 80;

  useEffect(() => {
    const handleScroll = () => {


      
      const currentScrollY = window.scrollY;

      if (currentScrollY <= 0) {
        setHeaderState('visible');
        lastScrollY.current = currentScrollY;
        return;
      }

      if (currentScrollY > lastScrollY.current) {
        if (currentScrollY > headerHeight && currentScrollY <= headerHeight * 2.5) {
          setHeaderState('hidden');
        } 
        else if (currentScrollY > headerHeight * 2.5) {
          if (headerState !== 'sticky') {
            setHeaderState('sticky');
          }
        }
      } 
      else if (currentScrollY < lastScrollY.current) {
        setHeaderState('sticky');
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, [headerState]);

  // დინამიურად ვადგენთ აქტიურ კლასს styles ობიექტიდან
  const activeClass = styles[headerState]; 

  return (
    <header className={`${styles.customHeader} ${activeClass}`}>
      <div className={styles.logo}>ჩემი ლოგო</div>
      <nav className={styles.navigation}>
        <a href="#home">მთავარი</a>
        <a href="#about">ჩვენ შესახებ</a>
        <a href="#contact">კონტაქტი</a>
      </nav>
    </header>
  );
};

export default Header;