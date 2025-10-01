const bubble_sort = (arr) => {
  const n = arr.length;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
      }
    }
  }
  return arr;
}

const getRandomInt = max => {
  return Math.floor(Math.random() * max);
}

const n = parseInt(process.argv[2]);
arr = Array.from({length: n}, _ => getRandomInt(n));
bubble_sort(arr);
