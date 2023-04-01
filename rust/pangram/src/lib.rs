use std::collections::HashSet;
/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
  let mut letters: HashSet<char> = HashSet::new();
  for letter in sentence.chars() {
    if letter.is_ascii_alphabetic() {
      letters.insert(letter.to_ascii_lowercase());
    }
  }
  letters.len() == 26
}
