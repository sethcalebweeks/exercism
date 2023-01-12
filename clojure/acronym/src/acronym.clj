(ns acronym 
  (:require [clojure.string :as str]))

(defn acronym-word
  [word]
  (let [upper (filter #(not (Character/isLowerCase %)) word)]
    (if (= (count upper) (count word))
     (first word)
     (apply str upper))))

(defn capitalize-first
  [word]
  (let [[first & rest] word] (apply str (cons (str/upper-case first) rest))))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (apply str (map #(acronym-word (capitalize-first %)) (filter #(not= % "") (str/split phrase #"[ ,-]"))))
  )