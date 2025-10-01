import random
import sys


def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr


if __name__ == '__main__':
    n = int(sys.argv[1])
    arr = [random.randint(0, n - 1) for _ in range(n)]
    bubble_sort(arr)
