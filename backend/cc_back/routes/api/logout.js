var express = require('express');
var router = express.Router();

const userTokens = {};

router.post('/', (req, res) => {
    // 세션을 파기하여 로그아웃
    const {userToken} = req.body;
    const token = req.userToken;
    delete userTokens[token];
    res.status(204).send();
}); 
  
module.exports = router;