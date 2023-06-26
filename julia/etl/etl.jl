function transform(input::AbstractDict)
  reduce((output, score_letters) -> begin
    score, letters = score_letters
    for letter in letters
      output[lowercase(letter)] = score
    end
    return output
  end, input, init=Dict{Char, Int}())
end

