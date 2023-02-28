type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let map = function
  | `G -> `C
  | `C -> `G
  | `T -> `A
  | `A -> `U

let to_rna = List.map map
