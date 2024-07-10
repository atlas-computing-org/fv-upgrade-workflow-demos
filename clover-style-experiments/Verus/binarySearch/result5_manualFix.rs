use vstd::prelude::*;

fn binary_search(a: &[i32], key: i32) -> (result: usize)
    requires
        // The array must be sorted in non-decreasing order
        forall|i: int, j: int| 0 <= i && i < j && j < a.len() ==> a[i] <= a[j],
    ensures
        // If `key` is in the array, then `a[result]` should be equal to `key`
        // Otherwise, `result` should be the first index where `a[result]` is greater than or equal to `key`
        (exists|i: int| 0 <= i && i < a.len() && a[i] == key ==> a[result as int] == key)
        || (forall|i: int| 0 <= i && i < a.len() && a[i] < key ==> result == a.len())
        || (forall|i: int| 0 <= i && i < result ==> a[i] < key) && (result == a.len() || a[result as int] >= key),
{
    let mut lo: usize = 0;
    let mut hi: usize = a.len();
    while lo < hi
        invariant
            // `lo` and `hi` should remain within bounds
            0 <= lo && hi <= a.len(),
            // All elements before `lo` are less than `key`
            forall|i: int| 0 <= i && i < lo as int ==> a[i] < key,
            // All elements from `hi` to the end are greater than or equal to `key`
            forall|i: int| hi as int <= i && i < a.len() ==> a[i] >= key,
            // The array must be sorted in non-decreasing order
            forall|i: int, j: int| 0 <= i && i < j && j < a.len() ==> a[i] <= a[j],
    {
        let mid = lo + (hi - lo) / 2;
        if a[mid] < key {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    lo
}

