const fibo = n => {
  if (n <= 1) {
    return n;
  }
  else {
    return fibo(n-1) + fibo(n-2);
  }
}

for (let n of process.argv.slice(2)) {
  console.log(`fibo(${n}) = ${fibo(n)}`);
}
