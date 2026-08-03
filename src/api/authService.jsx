const BASE_URL = "http://localhost:5001/api";

export async function handleRegister(formData) {
  try {
    const endpoint =
      formData.method === "email" ? "/register/email" : "/register/phone";

    const response = await fetch(`${BASE_URL}${endpoint}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || "დაფიქსირდა შეცდომა");
    }

    return { success: true, message: data.message, data };
  } catch (err) {
    return { success: false, error: err.message || "დაფიქსირდა შეცდომა" };
  }
}

export async function handleSignIn(formData) {
  try {
    const endpoint =
      formData.method === "email" ? "/signin/email" : "/signin/phone";

    const response = await fetch(`${BASE_URL}${endpoint}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || "დაფიქსირდა შეცდომა");
    }

    return { success: true, message: data.message, data, user: data.user };
  } catch (err) {
    return { success: false, error: err.message || "დაფიქსირდა შეცდომა" };
  }
}
