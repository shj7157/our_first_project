var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { orderToken } = req.body;
  let selectorderTbQuery =
    "SELECT ct.*, gt.Goods_name,gt.price FROM cart_tb ct JOIN goods_tb gt ON ct.goods_no = gt.Goods_no WHERE user_id = ? ";
  let selectorderTbParams = [orderToken];
  //console.log(orderToken);
  try {
    // 여기에서 dba.insert() 함수를 호출하고 에러 처리를 수행합니다.
    await dba.select(selectorderTbQuery, selectorderTbParams).then((result) => {
      if (result.length == 0) return console.log("no cart");
      //console.log(result);
      return res.json(result);
    });
  } catch (err) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
