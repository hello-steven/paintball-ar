#!/bin/bash
echo "Install"
npm install
echo "Server Test"
#run server in a sub shell
(
 node ./dist/app.js
)&
PID=$!
sleep 1
./node_modules/.bin/mocha  ./test/*.test.js
kill $PID