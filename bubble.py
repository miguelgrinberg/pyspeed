import random
import sys
import time


def bubble(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr


def main(threads, n):
    arr = [random.randint(0, n - 1) for _ in range(n)]
    if threads == 1:
        bubble(arr[:])
    else:
        from concurrent.futures import ThreadPoolExecutor

        with ThreadPoolExecutor(max_workers=threads) as executor:
            for _ in range(threads):
                executor.submit(bubble, arr[:])


if __name__ == '__main__':
    label = sys.argv[1]
    threads = int(sys.argv[2])
    n = int(sys.argv[3])
    sum = 0
    for _ in range(3):
        start = time.time()
        main(threads, n)
        end = time.time()
        sum += end - start
    avg = sum / 3
    print(f'{avg:.04f} {label}')
