#[executable]
fn main(n: u64) {
    let current_year: u64 = 2026;

    assert(n <= current_year, 'INVALID');

    let age = current_year - n;

    assert(age >= 18, 'UNDERAGE');
    assert(age <= 60, 'OVERAGE');
}