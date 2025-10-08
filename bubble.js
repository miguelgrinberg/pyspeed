const bubble = (arr) => {
  const n = arr.length;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n - i - 1; j++) {
      const a = arr[j];
      const b = arr[j + 1];
      if (a > b) {
        arr[j] = b;
        arr[j + 1] = a;
      }
    }
  }
  return arr;
}

const getRandomInt = max => {
  return Math.floor(Math.random() * max);
}

const label = process.argv[2];
const n = process.argv[3];
let sum = 0;
for (let i = 0; i < 3; i++) {
  const arr = Array.from({length: n}, _ => getRandomInt(n));
  const start = Number(process.hrtime.bigint() / 100000n) / 10000;
  bubble(arr);
  const end = Number(process.hrtime.bigint() / 100000n) / 10000;
  sum += end - start;
}
console.log(parseInt(sum / 3 * 10000) / 10000, label);
