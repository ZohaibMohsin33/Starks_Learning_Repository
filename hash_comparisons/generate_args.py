import sys
import json

def serialize_bytearray(s):
    data = s.encode('ascii')
    chunks = []
    i = 0
    # Split into 31-byte chunks (Cairo's ByteArray internal format)
    while i + 31 <= len(data):
        chunk = data[i:i+31]
        val = int.from_bytes(chunk, 'big')
        chunks.append(hex(val))
        i += 31

    # Remaining bytes (less than 31)
    pending = data[i:]
    pending_word = int.from_bytes(pending, 'big') if pending else 0
    pending_word_len = len(pending)

    # Final format: [num_chunks, ...chunks, pending_word, pending_word_len]
    result = [hex(len(chunks))] + chunks + [hex(pending_word), hex(pending_word_len)]
    return result

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 generate_args.py <your_hash>")
        sys.exit(1)

    hash_str = sys.argv[1]
    serialized = serialize_bytearray(hash_str)

    with open('args.json', 'w') as f:
        json.dump(serialized, f, indent=2)

    print(f"args.json created successfully")
    print(f"Serialized: {serialized}")