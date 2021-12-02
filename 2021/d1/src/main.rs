use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;


fn main() {
    // let lines = numbers_from_file("../input.txt");
    // let file_name = "../example.txt";
    let file_name = "../input.txt";
    let input_str = std::fs::read_to_string(file_name).unwrap();
    let lines: Vec<i32> = input_str
        .split("\n")
        .filter(|l| l.len() > 0)
        .map(|i| Ok::<i32,std::num::ParseIntError>(i.parse().unwrap()).expect("Could not parse line") )
        .collect();

    let p1: i32 = lines.windows(2)
        .map(|x| if x[0] < x[1] {1} else {0})
        .sum();

    println!("Part 1: {}", p1);

    let p2: i32 = lines.windows(4)
        .map(|x| if x[0] < x[3] {1} else {0})
        .sum(); 

    println!("Part 2: {}", p2);
}

// fn numbers_from_file(filename: impl AsRef<Path>) -> Vec<i32> {
//     let file = File::open(filename).expect("no such file");
//     let buf = BufReader::new(file);
//     buf.lines()
//         .map(|l| l.expect("Could not parse line"))
//         .map(|i| i.parse::<i32>().unwrap())
//         .collect()
// }