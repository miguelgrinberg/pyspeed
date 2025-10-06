use std::env;
use std::time::Instant;

pub fn fibo(n: u32) -> u32 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibo(n - 1) + fibo(n - 2),
    }
}

pub fn main() {
    let args: Vec<String> = env::args().collect();
    let label = args[1].clone();
    let n: u32 = args[2].parse().unwrap();
    let mut sum: f64 = 0.0;
    for _ in 0..3 {
        let start = Instant::now();
        fibo(n);
        let dur = start.elapsed();
        sum += dur.as_secs_f64();
    }
    println!("{:.4} {}", sum / 3.0, label);
}
