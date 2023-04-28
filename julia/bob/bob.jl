function isquestion(stimulus)
  return endswith(stimulus, "?")
end

function isyell(stimulus)
  uppercase_stimulus = uppercase(stimulus)
  return stimulus == uppercase_stimulus && count(x -> x in 'A':'Z', uppercase_stimulus) > 0
end

function bob(stimulus)
  stimulus = strip(stimulus)
  if isempty(stimulus)
    return "Fine. Be that way!"
  elseif isquestion(stimulus) && isyell(stimulus)
    return "Calm down, I know what I'm doing!"
  elseif isquestion(stimulus) 
    return "Sure."
  elseif isyell(stimulus)
    return "Whoa, chill out!"
  else
    return "Whatever."
  end
end