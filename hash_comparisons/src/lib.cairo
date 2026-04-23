fn is_in_golden_list(user_hash: @ByteArray) -> bool {
    let mut golden_list: Array<ByteArray> = array![
        "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824",
        "486ea46224d1bb4fb680f34f7c9ad96a8f24ec88be73ea8e5a6c6522e3c4e6a5",
        "c5d3f7f8d5b2c1e6a4f9e8d7b6c5a4b3c2d1e0f1a2b3c4d5e6f7a8b9c0d1e2f3",
        "7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069",
        "3a6eb0790f39ac87c94f3856b2dd2c5d110e6811602261a9a923d3bb23adc8b7",
        "d7b553c6f09ac85d142415f857c5310f5bb0727a70f0c2e8f0b6b7c9d8e9f0a1",
        "8b1a9953c4611296a827abf8c47804d7e6c4b6c4e6c5a6b8c9d0e1f2a3b4c5d6",
        "e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8",
        "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2",
        "f1e2d3c4b5a69788766554433221100ff1e2d3c4b5a69788766554433221100f",
    ];

    let mut found = false;
    let mut i: usize = 0;

    // IMPORTANT: never break early — full loop hides WHICH hash matched
    loop {
        if i == golden_list.len() {
            break;
        }
        if user_hash == golden_list[i] {
            found = true;
        }
        i += 1;
    };

    found
}
#[executable]
// Prover feeds their secret hash here as private input
fn main(secret_hash: ByteArray) -> bool {
    let result = is_in_golden_list(@secret_hash);
    assert!(result, "Hash is not in the golden list!");
    result
}

#[cfg(test)]
mod tests {
    use super::is_in_golden_list;

    #[test]
    fn test_known_hash_matches() {
        let h: ByteArray = "7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069";
        assert!(is_in_golden_list(@h), "Hash should be in list");
    }

    #[test]
    fn test_unknown_hash_fails() {
        let h: ByteArray = "0000000000000000000000000000000000000000000000000000000000000000";
        assert!(!is_in_golden_list(@h), "Unknown hash must not match");
    }

    #[test]
    fn test_empty_hash_fails() {
        let h: ByteArray = "";
        assert!(!is_in_golden_list(@h), "Empty hash must not match");
    }
}