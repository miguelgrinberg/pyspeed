use std::env;
use std::fs::File;
use std::io::Read;
use std::time::Instant;

fn bubble(arr: &mut Vec<u32>) -> &mut Vec<u32> {
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
    let args: Vec<String> = env::args().collect();
    let label = args[1].clone();
    let n: u32 = args[2].parse().unwrap();
    let mut f = File::open("/dev/urandom").unwrap();
    let mut buf = [0u8; 4];
    let mut sum: f64 = 0.0;
    for _ in 0..3 {
        let mut arr: Vec<u32> = Vec::new();
        for _ in 0..n {
            f.read(&mut buf).unwrap();
            arr.push(u32::from_ne_bytes(buf) % n);
        }
        let start = Instant::now();
        bubble(&mut arr);
        let dur = start.elapsed();
        sum += dur.as_secs_f64();
    }
    println!("{:.4} {}", sum / 3.0, label);
}
