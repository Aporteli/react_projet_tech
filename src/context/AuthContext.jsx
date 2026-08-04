import { createContext, useContext, useState, useEffect } from "react";

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  // 1. useState-ის საწყის მნიშვნელობად წავიკითხოთ LocalStorage
  const [user, setUser] = useState(() => {
    try {
      const savedUser = localStorage.getItem("user");
      return savedUser ? JSON.parse(savedUser) : null;
    } catch (error) {
      console.error("LocalStorage-ის წაკითხვის შეცდომა:", error);
      return null;
    }
  });

  const [token, setToken] = useState(() => {
    return localStorage.getItem("token") || null;
  });

  const [loading, setLoading] = useState(true);

  // 2. გვერდის პირველადი ჩატვირთვისას მონაცემების შემოწმება
  useEffect(() => {
    const savedUser = localStorage.getItem("user");
    const savedToken = localStorage.getItem("token");

    if (savedUser && savedToken) {
      setUser(JSON.parse(savedUser));
      setToken(savedToken);
    }
    setLoading(false);
  }, []);

  // 3. Login ფუნქცია — ინახავს მონაცემებს LocalStorage-შიც
  const login = (userData, userToken) => {
    setUser(userData);
    setToken(userToken);

    localStorage.setItem("user", JSON.stringify(userData));
    if (userToken) {
      localStorage.setItem("token", userToken);
    }
  };

  // 4. Logout ფუნქცია — ასუფთავებს LocalStorage-ს
  const logout = () => {
    setUser(null);
    setToken(null);

    localStorage.removeItem("user");
    localStorage.removeItem("token");
  };

  // isAuthenticated გამოითვლება ავტომატურად (თუ user არსებობს, არის true)
  const isAuthenticated = !!user;

  return (
    <AuthContext.Provider
      value={{ user, token, isAuthenticated, login, logout }}
    >
      {/* სანამ LocalStorage-ის შემოწმება არ დასრულდება, არაფერი არ დარენდერდეს */}
      {!loading && children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};
