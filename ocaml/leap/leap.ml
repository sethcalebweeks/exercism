let mult_of year x = year mod x == 0
let leap_year = function
  | year when mult_of year 400 -> true
  | year when mult_of year 100 -> false
  | year when mult_of year 4 -> true
  | _ -> false