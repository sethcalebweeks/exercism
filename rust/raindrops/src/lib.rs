fn sound(n: u32, (sound, factor): (&str, u32)) -> String {
  match n % factor {
    0 => sound.to_string(),
    _ => String::new(),
  }
}

pub fn raindrops(n: u32) -> String {
  let sounds = [("Pling", 3), ("Plang", 5), ("Plong", 7)]
    .map(|tuple| sound(n, tuple))
    .join("");
  
  match sounds.as_str() {
    "" => n.to_string(),
    _ => sounds,
  }
}
