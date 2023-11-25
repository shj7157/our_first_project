var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { cartbuyToken } = req.body;
  let cartList = cartbuyToken.split(",");
  cartList.map((item) => parseInt(item));
  let selectorderTbQuery =
    "SELECT ct.*, gt.Goods_name,gt.price FROM cart_tb ct JOIN goods_tb gt ON ct.goods_no = gt.Goods_no JOIN user_tb ut ON ct.user_id = ut.ID WHERE cart_no IN (?) ";
  let selectorderTbParams = [cartList];
  try {
    await dba.select(selectorderTbQuery, selectorderTbParams).then((result) => {
      console.log(result);
      return res.json(result);
    });
  } catch (e) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
