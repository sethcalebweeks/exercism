(ns acronym 
  (:require [clojure.string :as str]))

(defn keep-capitals [acc [fst snd]]
  (cond
    (and (Character/isUpperCase fst) (not (Character/isUpperCase snd))) (str acc fst) 
    (and (not (Character/isLetter fst)) (Character/isLowerCase snd)) (str acc (str/upper-case snd))
    :else acc))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (reduce keep-capitals "" (partition 2 1 phrase))
  )