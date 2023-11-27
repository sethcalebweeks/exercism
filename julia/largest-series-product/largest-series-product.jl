function largest_product(str, span)
    if span > length(str) || span < 0 || !all(isdigit, str)
        throw(ArgumentError("invalid arguments"))
    end
    max = 0
    for series in [str[start:start + span - 1] for start in 1:length(str) - span + 1]
        product = prod([parse(Int, digit) for digit in series])
        max = product > max ? product : max
    end
    max
end