import gleam/string
import gleam/list
import gleam/result

pub fn message(log_line: String) -> String {
  log_line
  |> string.crop(":")
  |> string.drop_left(2)
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  log_line
  |> string.drop_left(1)
  |> string.split("]")
  |> list.first
  |> result.unwrap("")
  |> string.lowercase
}

pub fn reformat(log_line: String) -> String {
  string.concat([
    message(log_line),
    " (",
    log_level(log_line),
    ")"
  ])
}
