#[executable]
fn main(n: u64) {
    assert(n % 2 == 0, 'number is not even');
    println!("{}", n);
}