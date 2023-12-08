function Queen(pos)
  local row = pos.row
  local column = pos.column
  if row < 0 or row > 7 then
    error()
  elseif column < 0 or column > 7 then
    error()
  else
    return {
      row = row,
      column = column,
      can_attack = function (q2)
        return 
          q2.row == row or 
          q2.column == column or
          math.abs(q2.row - row) == math.abs(q2.column - column)
      end
    }
  end
end

return Queen
