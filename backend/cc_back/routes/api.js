//api.js

var express = require("express");
var router = express.Router();

// 하위 api 라우터
const loginRouter = require("./api/login");
const joinRouter = require("./api/join");
const logoutRouter = require("./api/logout");
const checkLoginRouter = require("./api/checklogin");
const myinfoRouter = require("./api/myinfo");
const updateUserInfoRouter = require("./api/updateUserInfo");
const goodsRouter = require("./api/goods");
const orderRouter = require("./api/order");
const buyRouter = require("./api/buy");
const cartRouter = require("./api/cart");
const cartbuyRouter = require("./api/cart_buy");
const payRouter = require("./api/pay");
const buyUserRouter = require("./api/buy_user");
const buyGoodsRouter = require("./api/buy_goods");
const onebuyRouter = require("./api/onebuy");
const addtocartRouter = require("./api/addtocart");

router.use("/login", loginRouter);
router.use("/join", joinRouter);
router.use("/logout", logoutRouter);
router.use("/checklogin", checkLoginRouter);
router.use("/myinfo", myinfoRouter);
router.use("/updateUserInfo", updateUserInfoRouter);
router.use("/goods", goodsRouter);
router.use("/order", orderRouter);
router.use("/buy", buyRouter);
router.use("/cart", cartRouter);
router.use("/cart_buy", cartbuyRouter);
router.use("/pay", payRouter);
router.use("/buy_user", buyUserRouter);
router.use("/buy_goods", buyGoodsRouter);
router.use("/onebuy", onebuyRouter);
router.use("/addtocart", addtocartRouter);

module.exports = router;
