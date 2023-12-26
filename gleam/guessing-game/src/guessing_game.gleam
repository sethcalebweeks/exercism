pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    41 | 43 -> "So close"
    _ if guess > 42 -> "Too high"
    _ -> "Too low"
  }
}
