local Character = {}

local function ability(scores)
  local ability = 0
  table.sort(scores)
  for i = 2, #scores do
    ability = ability + scores[i]
  end
  return ability
end

local function roll_dice()
  return {
    math.random(6),
    math.random(6),
    math.random(6),
    math.random(6)
  }
end

local function modifier(input)
  return math.floor((input - 10) / 2)
end

function Character:new(name)
  self.__index = self
  local constitution = ability(roll_dice())
  return setmetatable({
    name = name,
    strength = ability(roll_dice()),
    dexterity = ability(roll_dice()),
    constitution = constitution,
    intelligence = ability(roll_dice()),
    wisdom = ability(roll_dice()),
    charisma = ability(roll_dice()),
    hitpoints = 10 + modifier(constitution)
  }, self)
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
