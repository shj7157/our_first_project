// utils/dbs.js
// mysql 모듈과 필요한 유틸리티 모듈들을 불러옵니다.
const mysql = require("mysql2/promise");

// mysql pool을 생성합니다.
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: "cc",
});

// mysql pool에서 connection을 가져오는 함수입니다.
async function getConnection() {
  try {
    let conn = await pool.getConnection();
    return conn;
  } catch (err) {
    // 연결에 실패할 경우 에러 로그를 남깁니다.
    throw err;
  }
}

// 쿼리를 실행하는 함수입니다.
async function executeQuery(query, params) {
  let conn;
  try {
    conn = await getConnection();
    const res = await conn.query(query, params);
    return res;
  } catch (err) {
    // 쿼리 실행 중에 에러가 발생하면 에러 로그를 남깁니다.
    throw err;
  } finally {
    // 쿼리 실행 후에는 반드시 연결을 해제합니다.
    if (conn) conn.release();
  }
}

// SELECT 쿼리를 실행하는 함수입니다.
async function select(query, params) {
  const [rows, fields] = await executeQuery(query, params);
  return rows;
}

// INSERT 쿼리를 실행하는 함수입니다.
async function insert(query, params) {
  try {
    const res = await executeQuery(query, params);
    return res;
  } catch (error) {
    // console.error(error);
    throw error;
  }
}

// UPDATE 쿼리를 실행하는 함수입니다.
async function update(query, params) {
  const res = await executeQuery(query, params);
  return res;
}

// DELETE 쿼리를 실행하는 함수입니다.
async function remove(query, params) {
  const res = await executeQuery(query, params);
  return res;
}

// 각 함수들을 모듈로 내보냅니다.
module.exports = {
  select,
  insert,
  update,
  remove,
};
