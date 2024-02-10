#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title email-with-alias
// @raycast.mode compact

// Optional parameters:
// @raycast.icon 🤖
// @raycast.packageName email-with-alias

// Documentation:
// @raycast.author r-tomiyama
// @raycast.authorURL https://raycast.com/r-tomiyama

const currentDate = new Date();
const year = currentDate.getFullYear();
const month = String(currentDate.getMonth() + 1).padStart(2, '0');
const day = String(currentDate.getDate()).padStart(2, '0');
const hour = String(currentDate.getHours()).padStart(2, '0');
const minute = String(currentDate.getMinutes()).padStart(2, '0');

const formattedDateTime = `${year}${month}${day}${hour}${minute}`;
formattedDateTime;

console.log(`ryoko.tomiyama+${formattedDateTime}@workside.co.jp`);
