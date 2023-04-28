function sound(n)
  (sound, factor)::Tuple{String, Int64} -> n % factor == 0 ? sound : ""
end

function raindrops(number)
  [("Pling", 3), ("Plang", 5), ("Plong", 7)] |>
  (x -> map(sound(number), x)) |> join |>
  (x -> x == "" ? string(number) : x)
end
