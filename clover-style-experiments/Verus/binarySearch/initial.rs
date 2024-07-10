fn binary_search(a: &[i32], key: i32) -> usize {
    let mut lo = 0;
    let mut hi = a.len();
    while lo < hi {
        let mid = (lo + hi) / 2;
        if a[mid] < key {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    lo
}


fn main() {
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    let key = 5;
    let result = binary_search(&array, key);
    println!("The position of the key is: {}", result);
}

