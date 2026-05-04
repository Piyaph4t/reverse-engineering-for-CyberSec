output = "apijaczhzgtfnyjgrdvqrjbmcurcmjczsvbwgdelvxxxjkyigy"

def popcount(x):
    return bin(x).count("1")

res = ""

for i, y in enumerate(output):
    if not ('a' <= y <= 'z'):
        # keep non-lowercase as-is (important for '\t')
        res += y
        continue

    u = popcount(i % 255)
    shift = (6 * u) % 26

    x = (ord(y) - ord('a') - shift) % 26
    res += chr(x + ord('a'))

print(res)
