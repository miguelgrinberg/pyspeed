use std::env;

pub fn fibo(n: u32) -> u32 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibo(n - 1) + fibo(n - 2),
    }
}

pub fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    for arg in args.iter() {
        let n: u32 = arg.parse().unwrap();
        println!("fibo({}) = {}", n, fibo(n));
    }
}
