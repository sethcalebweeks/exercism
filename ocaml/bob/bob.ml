let is_question = String.ends_with ~suffix:"?"

let is_yell s = 
  let upper = String.uppercase_ascii s in
  let is_letter c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') in
  let count = s |> String.to_seq |> Seq.filter is_letter |> Seq.length in
    s = upper && count > 0

let response_for s = 
  match String.trim s with
  | "" -> "Fine. Be that way!"
  | s when is_yell s && is_question s -> "Calm down, I know what I'm doing!"
  | s when is_question s -> "Sure."
  | s when is_yell s -> "Whoa, chill out!"
  | _ -> "Whatever."