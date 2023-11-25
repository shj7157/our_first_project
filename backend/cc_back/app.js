var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var cors = require("cors");
const session = require("express-session");
const MemoryStore = require("memorystore")(session);
var port = 3000;
const dba = require("./util/dba.js");

//var checkloginRouter = require('./routes/api/checklogin');
var indexRouter = require("./routes/index");
const apiRouter = require("./routes/api");

var app = express();

app.use(
  cors({
    credentials: true,
  })
);
app.use(cookieParser());
// 세션 설정
let maxAge = 3 * 60 * 60 * 1000;
let sessionObj = {
  secret: "1234", // 세션 암호화에 사용할 시크릿 키
  resave: false,
  saveUninitialized: true,
  store: new MemoryStore({ checkPeriod: maxAge }),
  cookie: {
    maxAge: maxAge,
    secure: true, // HTTPS가 아닌 경우 false로 설정하세요.
    httpOnly: true, // 클라이언트 측 JavaScript가 쿠키를 접근하지 못하도록 설정
    sameSite: "lax", // 필요에 따라 'none' 또는 'strict'로 변경 가능
  },
};
app.use(session(sessionObj));

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");

app.use(express.static("public"));
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/api", apiRouter);
app.use(function (req, res, next) {
  next(createError(404));
});

app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
