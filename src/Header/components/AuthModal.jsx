import { useState, useEffect } from "react";
import { FiX } from "react-icons/fi";
import { FcGoogle } from "react-icons/fc";
import styles from "../Header.module.css";
import SiteLogo from "../../icons/siteLogoOnSignIn";
import { useModal } from "../../hooks/useModal";
import { useAuth } from "../../context/AuthContext";
// 1. გადავარქვით სახელები იმპორტში, რომ კონფლიქტი არ მოხდეს
import {
  handleRegister as registerApi,
  handleSignIn as signInApi,
} from "../../api/authService";

export default function AuthModal({ openModal, closeModal }) {
  const { login } = useAuth();
  const [authMode, setAuthMode] = useState("signin");
  const [authMethod, setAuthMethod] = useState("phone");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [countryCode, setCountryCode] = useState("+995");
  const [agreeTerms, setAgreeTerms] = useState(false);
  const [agreeMarketing, setAgreeMarketing] = useState(false);
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  const handleClose = () => {
    closeModal();
  };

  const handleSignUp = async () => {
    if (authMethod === "phone" && !phoneNumber) {
      setError("Please enter your mobile number");
      return;
    }

    if (authMethod === "email" && (!email || !password)) {
      setError("Please enter your email and password");
      return;
    }

    if (!agreeTerms) {
      setError("Please agree to the terms and conditions");
      return;
    }

    setLoading(true);
    setError("");
    setMessage("");

    const formData = {
      method: authMethod,
      agreeTerms,
      agreeMarketing,
    };

    if (authMethod === "phone") {
      formData.phoneNumber = `${countryCode}${phoneNumber}`;
    } else {
      formData.email = email;
      formData.password = password;
    }

    // 2. გამოვიძახეთ registerApi
    const result = await registerApi(formData);

    if (result.success) {
      setMessage(result.message);
      setPhoneNumber("");
      setEmail("");
      setPassword("");
      setAgreeTerms(false);
      setAgreeMarketing(false);
      setTimeout(() => {
        setAuthMode("signin");
        setMessage("");
      }, 2000);
    } else {
      setError(result.error);
    }

    setLoading(false);
  };

  const handleSignIn = async () => {
    if (authMethod === "phone" && !phoneNumber) {
      setError("Please enter your mobile number");
      return;
    }

    if (authMethod === "email" && (!email || !password)) {
      setError("Please enter your email and password");
      return;
    }

    setLoading(true);
    setError("");
    setMessage("");

    const formData = {
      method: authMethod,
    };

    if (authMethod === "phone") {
      formData.phoneNumber = `${countryCode}${phoneNumber}`;
    } else {
      formData.email = email;
      formData.password = password;
    }

    // 3. გამოვიძახეთ signInApi (და არა handleSignIn)
    const result = await signInApi(formData);
    console.log(result, "result")

    if (result.success) {
      localStorage.setItem("token", result.data.token);
      localStorage.setItem("user", JSON.stringify(result.user));
      login(result.user);
      setMessage(result.message);
      setPhoneNumber("");
      setEmail("");
      setPassword("");
      setTimeout(() => {
        closeModal();
        setMessage("");
      }, 1000);
    } else {
      setError(result.error);
    }

    setLoading(false);
  };

  useModal(openModal);

  if (!openModal) return null;

  return (
    <div className={styles.authModalOverlay} onClick={handleClose}>
      <div
        className={styles.authModalContent}
        onClick={(e) => {
          e.stopPropagation();
        }}
      >
        <button className={styles.authModalClose} onClick={handleClose}>
          <FiX />
        </button>

        <div className={styles.authModalLogo}>
          <div className={styles.authModalLogoIcon}>
            <SiteLogo className={styles.authModalLogoIcon} />
          </div>
        </div>

        <h2 className={styles.authModalTitle}>Profile</h2>
        <p className={styles.authModalSubtitle}>
          {authMode === "signin" ? "Authorize In The System" : "Create Account"}
        </p>

        {authMode === "signin" ? (
          <>
            <div className={styles.authToggle}>
              <button
                className={`${styles.authToggleButton} ${
                  authMethod === "phone" ? styles.authToggleActive : ""
                }`}
                onClick={() => setAuthMethod("phone")}
              >
                By Phone
              </button>
              <button
                className={`${styles.authToggleButton} ${
                  authMethod === "email" ? styles.authToggleActive : ""
                }`}
                onClick={() => setAuthMethod("email")}
              >
                By Email
              </button>
            </div>

            {authMethod === "phone" ? (
              <div className={styles.authForm}>
                <div className={styles.phoneInputContainer}>
                  <select
                    className={styles.countryCodeSelect}
                    value={countryCode}
                    onChange={(e) => setCountryCode(e.target.value)}
                  >
                    <option value="+995">+995</option>
                    <option value="+1">+1</option>
                    <option value="+44">+44</option>
                    <option value="+49">+49</option>
                    <option value="+7">+7</option>
                  </select>
                  <input
                    type="tel"
                    className={styles.authInput}
                    placeholder="Mobile number"
                    value={phoneNumber}
                    onChange={(e) => setPhoneNumber(e.target.value)}
                  />
                </div>
                <button
                  className={styles.authPrimaryButton}
                  onClick={handleSignIn}
                  disabled={loading}
                >
                  {loading ? "Signing In..." : "Get Code"}
                </button>
              </div>
            ) : (
              <div className={styles.authForm}>
                <input
                  type="email"
                  className={styles.authInput}
                  placeholder="Email address"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
                <input
                  type="password"
                  className={styles.authInput}
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <button
                  className={styles.authPrimaryButton}
                  onClick={handleSignIn}
                  disabled={loading}
                >
                  {loading ? "Signing In..." : "Sign In"}
                </button>
              </div>
            )}

            <button className={styles.authGoogleButton}>
              <FcGoogle className={styles.authGoogleIcon} />
              Sign in with Google
            </button>

            <button
              className={styles.authSecondaryButton}
              onClick={() => setAuthMode("signup")}
            >
              Sign Up
            </button>
          </>
        ) : (
          <>
            <div className={styles.authToggle}>
              <button
                className={`${styles.authToggleButton} ${
                  authMethod === "phone" ? styles.authToggleActive : ""
                }`}
                onClick={() => setAuthMethod("phone")}
              >
                By Phone
              </button>
              <button
                className={`${styles.authToggleButton} ${
                  authMethod === "email" ? styles.authToggleActive : ""
                }`}
                onClick={() => setAuthMethod("email")}
              >
                By Email
              </button>
            </div>

            <div className={styles.authForm}>
              {authMethod === "phone" ? (
                <div className={styles.phoneInputContainer}>
                  <select
                    className={styles.countryCodeSelect}
                    value={countryCode}
                    onChange={(e) => setCountryCode(e.target.value)}
                  >
                    <option value="+995">+995</option>
                    <option value="+1">+1</option>
                    <option value="+44">+44</option>
                    <option value="+49">+49</option>
                    <option value="+7">+7</option>
                  </select>
                  <input
                    type="tel"
                    className={styles.authInput}
                    placeholder="Mobile Number"
                    value={phoneNumber}
                    onChange={(e) => setPhoneNumber(e.target.value)}
                  />
                </div>
              ) : (
                <>
                  <input
                    type="email"
                    className={styles.authInput}
                    placeholder="Email Address"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                  />
                  <input
                    type="password"
                    className={styles.authInput}
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                  />
                </>
              )}
            </div>

            <div className={styles.authCheckboxes}>
              <label className={styles.authCheckboxLabel}>
                <input
                  type="checkbox"
                  className={styles.authCheckbox}
                  checked={agreeTerms}
                  onChange={(e) => setAgreeTerms(e.target.checked)}
                />
                <span className={styles.authCheckboxText}>
                  By Clicking On Sign Up Button I Agree To Terms And Conditions
                </span>
              </label>
              <label className={styles.authCheckboxLabel}>
                <input
                  type="checkbox"
                  className={styles.authCheckbox}
                  checked={agreeMarketing}
                  onChange={(e) => setAgreeMarketing(e.target.checked)}
                />
                <span className={styles.authCheckboxText}>
                  I Agree To Receive Information/Marketing Messages
                </span>
              </label>
            </div>

            {error && <div className={styles.authErrorMessage}>{error}</div>}
            {message && (
              <div className={styles.authSuccessMessage}>{message}</div>
            )}

            <button
              className={styles.authPrimaryButton}
              onClick={handleSignUp}
              disabled={loading}
            >
              {loading ? "Signing Up..." : "Sign Up"}
            </button>

            <button className={styles.authGoogleButton}>
              <FcGoogle className={styles.authGoogleIcon} />
              Sign in with Google
            </button>

            <button
              className={styles.authSecondaryButton}
              onClick={() => setAuthMode("signin")}
            >
              Sign In
            </button>
          </>
        )}
      </div>
    </div>
  );
}
