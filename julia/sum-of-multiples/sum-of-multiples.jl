function sum_of_multiples(limit, factors)
    sum(Set(x for x=1:(limit - 1), factor in factors if factor > 0 && x % factor == 0))
end