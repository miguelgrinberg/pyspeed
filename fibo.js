const fibo = n => {
  if (n <= 1) {
    return n;
  }
  else {
    return fibo(n-1) + fibo(n-2);
  }
}

const label = process.argv[2];
const n = process.argv[3];
let sum = 0;
for (let i = 0; i < 3; i++) {
  const start = Number(process.hrtime.bigint() / 100000n) / 10000;
  fibo(n);
  const end = Number(process.hrtime.bigint() / 100000n) / 10000;
  sum += end - start;
}
console.log(parseInt(sum / 3 * 10000) / 10000, label);
