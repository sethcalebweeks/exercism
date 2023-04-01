use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
  let mut graphemes: Vec<&str> = input.graphemes(true).collect();
  let len = graphemes.len();
  let middle = len / 2;
  for i in 0..middle {
    graphemes.swap(i, len - i - 1)
  }
  graphemes.concat()
}
