var express = require('express');
var router = express.Router();

// "check-login" 라우터 - 로그인 상태 확인
router.post('/', async (req, res) =>{
  const {userToken} = req.body;
  
  console.log(userToken);
  if (userToken) {
    // 로그인된 경우
    return res.json({ success: true});
  } else {
    // 로그인되지 않은 경우
    return res.json({ success: false });
  }
});

module.exports = router;