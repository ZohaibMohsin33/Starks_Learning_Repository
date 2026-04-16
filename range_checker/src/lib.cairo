#[executable]
fn main(n: u64) {
    assert(n < 100, 'Out of range');
}