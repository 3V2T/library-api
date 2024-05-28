const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const helmet = require("helmet");
const session = require("express-session");
const cors = require("cors");
const xss = require("xss-clean");
require("dotenv").config();
const bookRouter = require("./routers/book.router");
const userRouter = require("./routers/user.router");
const categoryRouter = require("./routers/category.router");
const authorRouter = require("./routers/author.router");
const wishListRouter = require("./routers/wishlist.router");
const historyRouter = require('./routers/history.router')
const { authen } = require("./middlewares");
app.use(express.static("public"));
const PORT = 5000;
app.use(helmet());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(
  session({
    secret: "secret-key",
    resave: false,
    saveUninitialized: false,
  })
);

app.use(
  cors({
    origin: [],
  })
);

app.use(xss());

app.use("/api/v1/book", bookRouter);
app.use("/api/v1/user", userRouter);
app.get("/api/v1/authen", authen);
app.use("/api/v1/category", categoryRouter);
app.use("/api/v1/author", authorRouter);
app.use("/api/v1/wishlist", wishListRouter);
app.use('/api/v1/history', historyRouter)
app.get("/", (req, res) => {
  res.send("hello");
});
app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
