// Test TypeScript file

function greet(name: string): string {
  return `Hello, ${name}!`;
}

function add(a: number, b: number): number {
  return a + b;
}

console.log(greet("TypeScript"));
console.log(`2 + 3 = ${add(2, 3)}`);

export { greet, add };
