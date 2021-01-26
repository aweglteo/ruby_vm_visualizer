import React, { useEffect, useState } from 'react'
import socketIOClient from 'socket.io-client'

const ENDPOINT = "localhost:4201";

function DataTracer() {
  const [dataarray, setDataarray] = useState([]);
  const [count, setCount] = useState([]);

  useEffect(() => {
    const connection = new WebSocket('ws://localhost:4201');
    connection.onopen = function () {
      connection.send('こんにちは世界');
    };
    connection.onerror = function (error) {
    };
    connection.onmessage = function (e) {
      console.log(e)
    };

  }, []);
  return (
    <div>
      <p>{  count }</p>
      <p>This is data section</p>
    </div>
  );
}


export default DataTracer;

