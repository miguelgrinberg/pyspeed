import sys


def fibo(n):
    if n <= 1:
        return n
    else:
        return fibo(n-1) + fibo(n-2)


if __name__ == '__main__':
    for n in sys.argv[1:]:
        print(n, fibo(int(n)))
