use std::env;
use std::fs::File;
use std::io::Read;

fn bubble_sort(arr: &mut Vec<u32>) -> &mut Vec<u32> {
    /*
    let mut swapped = true;

    while swapped {
        swapped = false;
        for i in 0..arr.len()-1 {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }
    }
    */
    let n: usize = arr.len();
    for i in 0..n {
        for j in 0..n-i-1 {
            if arr[j] > arr[j+1] {
                arr.swap(j, j+1);
            }
        }
    }
       
    return arr;
}

pub fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    let n: u32 = args[0].parse().unwrap();
    let mut arr: Vec<u32> = Vec::new();
    let mut f = File::open("/dev/urandom").unwrap();
    let mut buf = [0u8; 4];
    for _ in 0..n {
        f.read(&mut buf).unwrap();
        arr.push(u32::from_ne_bytes(buf) % n);
    }
    bubble_sort(&mut arr);
}
