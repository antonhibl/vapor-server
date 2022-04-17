
let canvas = document.querySelector('#canvas');
let ctx = canvas.getContext('2d');
let width = canvas.width;// 500
let height = canvas.height;// 300

canvas.width = 600;
canvas.height = 400;

// set fill and stroke styles
ctx.fillStyle = '#F0DB4F';
ctx.strokeStyle = 'red';

// draw a rectangle with fill and stroke
ctx.fillRect(50, 50, 150, 100);
ctx.strokeRect(50, 50, 150, 100);
