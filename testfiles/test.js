// Test JavaScript file

function greet(name) {
  return `Hello, ${name}!`;
}

function add(a, b) {
  return a + b;
}

console.log(greet("JavaScript"));
console.log(`2 + 3 = ${add(2, 3)}`);

module.exports = { greet, add };
