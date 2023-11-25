var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { userId, buyToken, Goods_q } = req.body;
  let insertcartTbQuery =
    "INSERT INTO cart_tb (user_id, goods_no, Goods_q) VALUES (?, ?, ?)";
  let insertcartTbParams = [userId, buyToken, Goods_q];
  //console.log(userId, buyToken);
  try {
    await dba.insert(insertcartTbQuery, insertcartTbParams).then((result) => {
      //console.log(result2);
      res.json(result);
    });
  } catch (err) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
