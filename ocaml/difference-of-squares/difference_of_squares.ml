let square x = x * x

let square_of_sum n = 
  List.init n (fun x -> x + 1)
  |> List.fold_left (+) 0
  |> square 

let sum_of_squares n =
  List.init n (fun x -> square (x + 1))
  |> List.fold_left (+) 0

let difference_of_squares n = 
  square_of_sum n - sum_of_squares n
    
