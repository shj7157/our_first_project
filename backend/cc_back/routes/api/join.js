var express = require('express');
var router = express.Router();
const dba = require('../../util/dba');

/* GET users listing. */
router.post('/', async (req, res, next) => {
  let {userid, password, username, addr, birth, phone} = req.body;

  let query = 'INSERT INTO user_tb (id, psw, user_name, addr, birth, phone) VALUES (?, ?, ?, ?, ?, ?)';
  let params = [userid, password, username, addr, birth, phone]
  try {
    // 여기에서 dba.insert() 함수를 호출하고 에러 처리를 수행합니다.
    const response = await dba.insert(query, params);
    console.log(response);
    return res.json({message: 'success'});
  } catch (err) {
    if(err = 'ER_DUP_ENTRY') return res.json({err: 'ER_DUP_ENTRY'});
    console.log(err);
    res.status(500).json({message:'오류가 발생했습니다.'});
    return; // 이 부분에서 함수를 빠져나감
  }
})

module.exports = router;
