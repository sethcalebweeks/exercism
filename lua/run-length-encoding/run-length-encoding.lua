
return {
  encode = function(s)
    local encoded = ""
    local current_count = 1
    for c = 2, #s do
      if string.sub(s, c, c) == string.sub(s, c - 1, c - 1) then
        if c == #s then
          encoded = encoded .. current_count + 1 .. string.sub(s, c, c)
        else
          current_count = current_count + 1
        end
      else
        local count = current_count == 1 and "" or current_count 
        encoded = encoded .. count .. string.sub(s, c - 1, c - 1)
        if c == #s then
          encoded = encoded .. string.sub(s, c, c)
        else
          current_count = 1
        end
      end
    end
    return encoded
  end,

  decode = function(s)
    local decoded = ""
    local count = ""
    for c = 1, #s do
      local char = string.sub(s, c, c)
      local next = string.sub(s, c + 1, c + 1)
      if tonumber(char) ~= nil and tonumber(next) == nil then
        decoded = decoded .. string.rep(next, tonumber(count .. char) - 1)
        count = ""
      elseif tonumber(char) ~= nil and tonumber(next) ~= nil then
        count = count .. char
      else
        decoded = decoded .. char
        count = ""
      end
    end
    return decoded
  end
}
