let is_question s =
  String.trim s
  |> String.to_seq
  |> List.of_seq
  |> List.rev
  |> List.hd
  |> (=) '?'

let is_empty s = String.trim s = ""
let response_for = function
  | s when is_question s -> "Sure."
  | s when is_empty s -> "Fine. Be that way!"
  | _ -> "Whatever."