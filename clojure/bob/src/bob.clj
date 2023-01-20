(ns bob 
  (:require [clojure.string :as str]))

(defn yelled? [s]
  (and (> (count (filter #(Character/isLetter %) s)) 0)
       (= 
        (count (filter #(Character/isLetter %) s))
        (count (filter #(Character/isUpperCase %) s)))))

(defn question? [s]
  (= (last s) \?))

(defn response-for [s]
  (let [trimmed (str/trim s)]
    (cond
      (and (question? trimmed) (yelled? trimmed)) "Calm down, I know what I'm doing!"
      (question? trimmed) "Sure."
      (yelled? trimmed) "Whoa, chill out!"
      (empty? trimmed) "Fine. Be that way!"
      :else "Whatever.")))