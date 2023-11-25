var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { cartbuyToken, userId } = req.body;
  console.log(`frontend req params: ${cartbuyToken}, ${userId}`);
  let cartList = cartbuyToken.split(",");
  cartList = cartList.map((item) => parseInt(item)); // 수정된 부분: map 함수 결과를 다시 cartList에 할당
  let selectorderTbQuery =
    "SELECT ct.goods_no FROM cart_tb ct JOIN goods_tb gt ON ct.goods_no = gt.Goods_no JOIN user_tb ut ON ct.user_id = ut.ID WHERE cart_no IN (?) ";
  let selectorderTbParams = [cartList];

  try {
    await dba.select(selectorderTbQuery, selectorderTbParams).then((result) => {
      let selectorder2TbQuery =
        "SELECT gt.goods_no, ct.Goods_q FROM cart_tb ct JOIN goods_tb gt ON ct.goods_no = gt.Goods_no JOIN user_tb ut ON ct.user_id = ut.ID WHERE cart_no IN (?) ";
      let selectorder2TbParams = [cartList];
      dba.select(selectorder2TbQuery, selectorder2TbParams).then((result1) => {
        console.log(
          `result:${JSON.stringify(result)} result1: ${JSON.stringify(result1)}`
        );
        result1.forEach((item, index) => {
          if (result[index].goods_no === item.goods_no) {
            result[index].Goods_q = item.Goods_q;
          }
        });

        result.forEach((item, index) => {
          let UpdateorederTbQuery =
            "INSERT INTO order_tb (user_id, goods_no, or_q, date) VALUES (?, ?, ?, NOW())";
          let UpadteorderTbParams = [userId, item.goods_no, item.Goods_q];

          dba
            .insert(UpdateorederTbQuery, UpadteorderTbParams)
            .then((result2) => {
              console.log(result2);
              let DeleteorderTbQuery =
                "DELETE ct.* FROM cart_tb ct JOIN user_tb ut ON ct.user_id = ut.ID WHERE cart_no IN (?) ";
              let DeleteorderTbParams = [cartList];
              dba
                .remove(DeleteorderTbQuery, DeleteorderTbParams)
                .then((result2) => {
                  console.log(result2);
                });
            });
        });
        return res.json({ success: true });
      });
    });
  } catch (e) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
