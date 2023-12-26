local all_your_base = {}

function reverse(tab)
  for i = 1, #tab // 2, 1 do
    tab[i], tab[#tab - i + 1] = tab[#tab - i + 1], tab[i]
  end
  return tab
end


function base_to_dec(base, digits)
  local dec = 0
  for i = 1, #digits do
    assert(digits[i] >= 0, 'negative digits are not allowed')
    assert(digits[i] < base, 'digit out of range')
    dec = dec * base + digits[i]
  end
  return dec
end

function dec_to_base(num, base)
  local digits = {}
  while num > 0 do
    local digit = num % base
    table.insert(digits, digit)
    num = (num - digit) / base
  end
  return reverse(digits)
end

all_your_base.convert = function(from_digits, from_base)
  return {
    to = function (to_base)
      assert(from_base >= 2, 'invalid input base')
      assert(to_base >= 2, 'invalid output base')
      local dec = base_to_dec(from_base, from_digits)
      if dec == 0 then
        return { 0 }
      else
        return dec_to_base(dec, to_base)
      end
    end
  }
end

return all_your_base
