import sys
import time


def fibo(n):
    if n <= 1:
        return n
    else:
        return fibo(n-1) + fibo(n-2)


def main(threads, n):
    if threads == 1:
        fibo(n)
    else:
        from concurrent.futures import ThreadPoolExecutor

        with ThreadPoolExecutor(max_workers=threads) as executor:
            for _ in range(threads):
                executor.submit(fibo, n)

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
