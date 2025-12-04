const express = require("express");
const mysql = require("mysql2");
const path = require("path");
const session = require("express-session");

const app = express();

// --- Session middleware (mütləq static və route-lardan əvvəl) ---
app.use(session({
  secret: "your-secret-key",
  resave: false,
  saveUninitialized: true
}));

// --- View engine və static ---
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));

// --- MySQL connection ---
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "dchellcatdemon170_23",
  database: "bagshoes"
});

db.connect(err => {
  if (err) {
    console.error("MySQL connection error:", err.message);
  } else {
    console.log("MySQL connected!");
  }
});

// --- Home route ---
app.get("/", (req, res) => {
  db.query("SELECT * FROM new_table", (err, rows) => {
    if (err) return res.status(500).send("DB error: " + err.message);
    res.render("home", { title: "Home", products: rows });
  });
});

// --- About route ---
app.get("/about", (req, res) => {
  res.render("about", { title: "About" });
});

// --- Shoes route ---
app.get("/ayaqqabi", (req, res) => {
  db.query("SELECT * FROM new_table WHERE TheShoes = 1", (err, rows) => {
    if (err) return res.status(500).send("DB error: " + err.message);
    res.render("shoes", { title: "Shoes", products: rows });
  });
});

// --- Bags route ---
app.get("/canta", (req, res) => {
  db.query("SELECT * FROM new_table WHERE TheBag = 1", (err, rows) => {
    if (err) return res.status(500).send("DB error: " + err.message);
    res.render("bags", { title: "Çantalar", products: rows });
  });
});

// --- ADD TO CART ---
app.get("/add-to-cart/:id", (req, res) => {
  const productId = req.params.id;

  if (!req.session.cart) req.session.cart = [];

  db.query("SELECT * FROM new_table WHERE productid = ?", [productId], (err, rows) => {
    if (err) return res.send("DB error");
    if (rows.length > 0) req.session.cart.push(rows[0]);
    res.redirect("/cart");
  });
});

// --- CART PAGE ---
app.get("/cart", (req, res) => {
  const cart = req.session.cart || [];
  let total = 0;

  cart.forEach(item => {
    let itemPrice = item.apply == 1 ? item.discount : item.price;
    total += Number(itemPrice);
  });

  res.render("cart", { title: "Cart", cart, total });
});

// --- REMOVE ITEM FROM CART ---
app.get("/remove-item/:id", (req, res) => {
  const id = req.params.id;
  if (req.session.cart) {
    req.session.cart = req.session.cart.filter(item => item.productid != id);
  }
  res.redirect("/cart");
});

// --- CLEAR CART ---
app.get("/clear-cart", (req, res) => {
  req.session.cart = [];
  res.redirect("/cart");
});

// --- Server start ---
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server işləyir: http://localhost:${PORT}`);
  console.log(`Çantalar: http://localhost:${PORT}/canta`);
  console.log(`Ayaqqabılar: http://localhost:${PORT}/ayaqqabi`);
});
