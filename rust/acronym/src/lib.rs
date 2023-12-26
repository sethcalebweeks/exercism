use regex::Regex;

pub fn abbreviate(phrase: &str) -> String {
  Regex::new(r"[A-Z][a-z]").unwrap()
    .replace_all(phrase, " $0")
    .split(|c: char| !c.is_alphabetic() && c != '\'')
    .filter(|s| !s.is_empty())
    .map(|s| s.chars().next().unwrap())
    .collect::<String>()
    .to_uppercase()
}


