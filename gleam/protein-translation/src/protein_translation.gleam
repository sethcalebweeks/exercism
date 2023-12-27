import gleam/list
import gleam/string
import gleam/result

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  rna
  |> string.split("")
  |> list.sized_chunk(3)
  |> list.map(fn(chunk) { string.join(chunk, "") })
  |> list.fold_until([], fn(acc, codon) {
    case codon {
      "AUG" -> list.Continue([Ok("Methionine"), ..acc])
      "UUU" | "UUC" -> list.Continue([Ok("Phenylalanine"), ..acc])
      "UUA" | "UUG" -> list.Continue([Ok("Leucine"), ..acc])
      "UCU" | "UCC" | "UCA" | "UCG" -> list.Continue([Ok("Serine"), ..acc])
      "UAU" | "UAC" -> list.Continue([Ok("Tyrosine"), ..acc])
      "UGU" | "UGC" -> list.Continue([Ok("Cysteine"), ..acc])
      "UGG" -> list.Continue([Ok("Tryptophan"), ..acc])
      "UAA" | "UAG" | "UGA" -> list.Stop(acc)
      _ -> list.Continue([Error(Nil), ..acc])
    }
  })
  |> list.reverse
  |> result.all
}