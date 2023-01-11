(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (let [[first] deck] first)
)

(comment
  (let [[first] [3 2 1]] first)
  )

(defn second-card
  "Returns the second card from deck."
  [deck]
  (let [[_ second] deck] second)
)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (let [[first second & rest] deck] (cons second (cons first rest)))
)

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (let [[first & rest] deck] [first rest])
)

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [deck]
  (let [[first & rest] deck] (filter #(not= % nil) (cons first (concat face-cards rest))))
)
