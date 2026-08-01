import { FaX } from "react-icons/fa6";
import styles from "./Footer.module.css";
import { FaFacebookF, FaInstagram,FaTiktok, FaYoutube } from "react-icons/fa";
import { LuMail, LuPhone, LuMapPin } from 'react-icons/lu';
import { useTranslation } from "react-i18next";

export default function Footer() {
  const { t } = useTranslation();
  return (
    <footer className={styles.footer}>
      <div className={styles.footerContentTop}>
        <div className={styles.footerContentTopItem}>
          <h3 className={styles.footerContentTopItemTitle}>Company</h3>
          <div className={styles.divider}></div>
          <ul className={styles.footerContentTopItemLinks}>
            <li className={styles.footerContentTopItemLink}>{t('footer.aboutUs.whoWeAre')}</li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.aboutUs.termsAndConditions')}
            </li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.aboutUs.howToBuyOnline')}
            </li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.aboutUs.onlinePaymentMethods')}
            </li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.aboutUs.addressesOfServiceCenters')}
            </li>
          </ul>
        </div>
        <div className={styles.footerContentTopItem}>
          <h3 className={styles.footerContentTopItemTitle}>Resources</h3>
          <div className={styles.divider}></div>
          <ul className={styles.footerContentTopItemLinks}>
            <li className={styles.footerContentTopItemLink}>{t('footer.termsAndConditions.warrantyTerms')}</li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.termsAndConditions.deviceOperationAndSafetyGuidelines')}
            </li>
            <li className={styles.footerContentTopItemLink}>
              {t('footer.termsAndConditions.deliveryTermsAndConditions')}
            </li>
            <li className={styles.footerContentTopItemLink}>
             {t('footer.termsAndConditions.personalDataPolicy')}
            </li>
          </ul>
        </div>
        <div className={styles.footerContentTopItem}>
          <h3 className={styles.footerContentTopItemTitle}>Legal</h3>
          <div className={styles.divider}></div>
          <ul className={styles.footerContentTopItemLinks}>
            <li className={styles.footerContentTopItemLink}>
              <FaFacebookF className={styles.footerContentTopItemLinkIcon} />
              <p>facebook</p>
            </li>
            <li className={styles.footerContentTopItemLink}>
              <FaInstagram className={styles.footerContentTopItemLinkIcon} />
              <p>instagram</p>
            </li>
            <li className={styles.footerContentTopItemLink}>
              <FaTiktok className={styles.footerContentTopItemLinkIcon} />
              <p>tiktok</p>
            </li>
            <li className={styles.footerContentTopItemLink}>
              <FaYoutube className={styles.footerContentTopItemLinkIcon} />
              <p>youtube</p>
            </li>
          </ul>
        </div>
        <div className={styles.footerContentTopItem}>
          <h3 className={styles.footerContentTopItemTitle}>Contact</h3>
          <div className={styles.divider}></div>
          <ul className={styles.footerContentTopItemLinks}>
            <li className={styles.footerContentTopItemLink}>
              <LuMail className={styles.footerContentTopItemLinkIcon} />
              <p>Email: info@cybermart.ge</p>
            </li>
            <li className={styles.footerContentTopItemLink}>
              <LuPhone className={styles.footerContentTopItemLinkIcon} />
              <p>Phone: +995 32 2 222 222</p>
            </li>
            <li className={styles.footerContentTopItemLink}>
              <LuMapPin className={styles.footerContentTopItemLinkIcon} />
              Address: Tbilisi, Georgia
            </li>
          </ul>
        </div>
      </div>
      <div className={styles.movingDivider}></div>
      <div className={styles.footerContentBottom}>
        <p>{t('footer.rights.title')}</p>
      </div>
    </footer>
  );
}
