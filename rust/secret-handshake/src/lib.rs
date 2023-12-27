pub fn actions(n: u8) -> Vec<&'static str> {
    let mut result = Vec::new();
    if n & 1 != 0 {
        result.push("wink");
    }
    if n & 2 != 0 {
        result.push("double blink");
    }
    if n & 4 != 0 {
        result.push("close your eyes");
    }
    if n & 8 != 0 {
        result.push("jump");
    }
    if n & 16 != 0 {
        result.reverse();
    }
    result
}
