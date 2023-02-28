
let sound n (sound, factor) =
  if n mod factor == 0 then sound else ""

let raindrop n =
  ["Pling", 3; "Plang", 5; "Plong", 7]
  |> List.map (sound n)
  |> String.concat ""
  |> (function | "" -> string_of_int n | s -> s)
  
