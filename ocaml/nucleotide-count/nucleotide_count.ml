open Base

let empty = Map.empty (module Char)

let nucleotides = ['A'; 'C'; 'G'; 'T']

let contains_invalid_char s = 
  List.fold (String.to_list s) false (fun _ b -> not (List.mem nucleotides b equal_char))

let count_nucleotide s = function
  | c when contains_invalid_char s -> Error c
  | c when not (List.mem nucleotides c equal_char) -> Error c
  | c -> Ok (List.fold (String.to_list s) 0 (fun a b -> if equal_char b c then a + 1 else a))

let count_nucleotides = function
  | "" -> Ok empty
  | s when contains_invalid_char s -> Error 'X'
  | s -> Ok (List.map nucleotides (count_nucleotide s))

