pub fn find(array: &[i32], key: i32) -> Option<usize> {
    if array.len() == 0 {
        return None;
    }
    let mut left = 0;
    let mut right = array.len() - 1;
    while left <= right {
        let middle = (left + right) / 2;
        if array[middle] == key {
            return Some(middle);
        } else if array[middle] < key {
            left = middle + 1;
        } else if middle > 0 {
            right = middle - 1;
        } else {
            return None;
        }
    }
    return None
}
