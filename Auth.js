import express from "express";
import bcrypt from "bcrypt";
import db from "./server.js"; // შენი MySQL კავშირი (მაგ. mysql2/promise)

const router = express.Router();

router.post("/register/email", async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res
      .status(400)
      .json({ message: "Please fill in all required fields" });
  }

  try {
    const [existingUser] = await db.query(
      "SELECT id FROM users WHERE email = ?",
      [email],
    );

    if (existingUser.length > 0) {
      return res
        .status(400)
        .json({ message: "User with this email already exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const [result] = await db.query(
      "INSERT INTO users (email, password) VALUES (?, ?)",
      [email, hashedPassword],
    );

    return res.status(201).json({
      message: "Registration successful",
      userId: result.insertId,
    });
  } catch (error) {
    console.error("Register Email Error:", error);
    return res
      .status(500)
      .json({ message: "Server error, please try again later" });
  }
});

router.post("/register/phone", async (req, res) => {
  const { phoneNumber, agreeTerms, agreeMarketing } = req.body;

  if (!phoneNumber) {
    return res
      .status(400)
      .json({ message: "Please fill in all required fields" });
  }

  if (!agreeTerms) {
    return res
      .status(400)
      .json({ message: "Please agree to the terms and conditions" });
  }

  try {
    const [existingUser] = await db.query(
      "SELECT id FROM users WHERE phone_number = ?",
      [phoneNumber],
    );

    if (existingUser.length > 0) {
      return res
        .status(400)
        .json({ message: "User with this phone number already exists" });
    }

    const [result] = await db.query(
      "INSERT INTO users (phone_number, agree_terms, agree_marketing) VALUES (?, ?, ?)",
      [phoneNumber, agreeTerms, agreeMarketing],
    );

    return res.status(201).json({
      message: "Registration successful",
      userId: result.insertId,
    });
  } catch (error) {
    console.error("Register Phone Error:", error);
    return res
      .status(500)
      .json({ message: "Server error, please try again later" });
  }
});

