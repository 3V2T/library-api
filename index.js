const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const helmet = require("helmet");
const session = require("express-session");
const cors = require("cors");
const xss = require("xss-clean");
require("dotenv").config();
const bookRouter = require("./routers/book.router");
const { genAccessToken, verifyAccessToken } = require("./ultis");
app.use(express.static("public"));
const PORT = 5000;
app.use(helmet());
app.use(bodyParser);
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
try {
  verifyAccessToken(
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoiS2hhY3ZpMjAwMyIsImlhdCI6MTcxMjYzNjAxNSwiZXhwIjoxNzEyNjM2MDI1fQ.ETPjnsysvLqYs6qT0p645Ei86JxOoofYWc7mStKqOlA"
  );
} catch (error) {
  console.log("unauthorize");
}
app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
