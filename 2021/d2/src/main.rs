static INPUT: &str = include_str!("../input.txt");

fn main() {
    let input: Vec<(&str, i32)> = INPUT
        .lines()
        .map(|x| x.split_once(" ").unwrap() )
        .map(|x| (x.0, x.1.parse().unwrap()))
        .collect();

    // p1
    let mut d = 0; // depth
    let mut h = 0; // horizontal

    input.iter()
        .for_each(|(orient, val)| match orient {
            &"forward" => h = h + val,
            &"down" => d = d + val,
            &"up" => d = d - val,
            _ => ()
        });

    println!("Part 1: {:?}", d * h);

    let mut d = 0; // depth
    let mut h = 0; // horizontal 
    let mut a = 0; // aim 

    input.into_iter()
        .for_each(|(orient, val)| match orient {
            "forward" => {
                h = h + val; 
                d = d + a * val;
            } 
            "down" => a = a + val,
            "up" => a = a - val,
            _ => ()
        });

    println!("Part 2: {:?}", d * h);
}
