
fn is_question(message: &str) -> bool {
  message.ends_with("?")
}

fn is_yell(message: &str) -> bool {
  let mut letters = message
    .chars()
    .filter(|char| char.is_ascii_alphabetic());
  let count = letters.clone().count();
  letters.all(|char| char.is_ascii_uppercase()) && count > 0 
}

pub fn reply(message: &str) -> &str {
  let string = "    a   ".trim();
  print!("trimmed {}", string);
  match message.trim() {
    "" => "Fine. Be that way!",
    m if is_question(m) && is_yell(m) => "Calm down, I know what I'm doing!",
    m if is_question(m) => "Sure.",
    m if is_yell(m) => "Whoa, chill out!",
    _ => "Whatever.",
  }
}
