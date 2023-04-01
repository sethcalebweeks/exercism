type allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats

let allergen_score = function
  | Eggs -> 1
  | Peanuts -> 2
  | Shellfish -> 4
  | Strawberries -> 8
  | Tomatoes -> 16
  | Chocolate -> 32
  | Pollen -> 64
  | Cats -> 128

let allergic_to score allergen = score >= allergen_score allergen

let worst_allergen = function
  | s when s >= 128 -> Cats
  | s when s >= 64 -> Pollen
  | s when s >= 32 -> Chocolate
  | s when s >= 16 -> Tomatoes
  | s when s >= 8 -> Strawberries
  | s when s >= 4 -> Shellfish
  | s when s >= 2 -> Peanuts
  | _ -> Eggs

let rec allergies = function
  | 0 -> []
  | s -> let worst = worst_allergen s in worst :: allergies (s - allergen_score worst)
  
