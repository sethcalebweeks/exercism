"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
  letters = Set{Char}()
  for char in input
    lowercase_char = lowercase(char)
    if lowercase_char in 'a':'z'
      push!(letters, lowercase_char)
    end
  end
  length(letters) == 26
end


