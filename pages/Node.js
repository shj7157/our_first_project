// 필요한 모듈을 가져옵니다.
const express = require('express');
const mariadb = require('mariadb');

const app = express();
const port = 3606;

// MariaDB 연결 풀을 설정합니다.
const pool = mariadb.createPool({
  host: '172.20.10.7',
  user: 'root',
  password: 'root',
  database: 'cc'
});

// POST 요청 처리를 위한 미들웨어 설정
app.use(express.urlencoded({ extended: true }));

// 루트 URL로 POST 요청을 처리합니다.
app.post('/', async (req, res) => {
  const { userid, password, username, addr, birth, phone } = req.body;

  try {
    const connection = await pool.getConnection();
    const query = `INSERT INTO user_tb (ID, psw, user_name, addr, birth, phone) VALUES (?, ?, ?, ?, ?, ?)`;
    await connection.query(query, [userid, password, username, addr, birth, phone]);
    connection.release();
    res.send(`학생 정보 저장 완료: 비밀번호 - ${password}`);
  } catch (err) {
    console.error(err);
    res.status(500).send('오류가 발생했습니다.');
  }
});

app.listen(port, () => {
  console.log(`서버가 포트 ${port}에서 실행 중입니다.`);
});
