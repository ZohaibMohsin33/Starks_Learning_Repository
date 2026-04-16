use core::pedersen::PedersenTrait;
use core::hash::HashStateTrait;

// ── Compute Pedersen commitment ───────────────────────────────────────
// PedersenTrait::new(base).update(value).finalize() → felt252
// Salt is the base, password is the update input.
// Order matters — swapping gives a completely different hash.
fn compute_commitment(password: felt252, salt: felt252) -> felt252 {
    PedersenTrait::new(salt)
        .update(password)
        .finalize()
}

// ── Main entry point ──────────────────────────────────────────────────
// Arguments (ALL PRIVATE — passed via --arguments, never in the proof):
//   password   : the secret
//   salt       : random nonce chosen at registration
//   commitment : the stored hash to verify against (public input)
#[executable]
fn main(password: felt252, salt: felt252, commitment: felt252) {
    let computed = compute_commitment(password, salt);
    assert(computed == commitment, 'wrong password or salt');
    // Only the commitment is printed — password and salt stay private
    println!("{}", commitment);
}

// ── Tests ─────────────────────────────────────────────────────────────
#[cfg(test)]
mod tests {
    use super::compute_commitment;

    // Run this first — copy the printed commitment number for proving
    #[test]
    fn print_commitment() {
        let password: felt252 = 42;
        let salt:     felt252 = 12345678;
        let c = compute_commitment(password, salt);
        println!("{}", c);
    }

    #[test]
    fn test_correct_pass() {
        let password: felt252 = 42;
        let salt:     felt252 = 12345678;
        let c = compute_commitment(password, salt);
        assert(compute_commitment(password, salt) == c, 'mismatch');
    }

    #[test]
    #[should_panic]
    fn test_wrong_password() {
        let salt:       felt252 = 12345678;
        let real        = compute_commitment(42, salt);
        let wrong       = compute_commitment(99, salt);
        assert(wrong == real, 'wrong password or salt');
    }

    #[test]
    #[should_panic]
    fn test_wrong_salt() {
        let password:   felt252 = 42;
        let real        = compute_commitment(password, 12345678);
        let wrong       = compute_commitment(password, 999);
        assert(wrong == real, 'wrong password or salt');
    }

    #[test]
    fn test_salt_makes_hashes_unique() {
        let password: felt252 = 42;
        assert(
            compute_commitment(password, 111) != compute_commitment(password, 222),
            'salt not working'
        );
    }
}
