(ns anagram
  (:require [clojure.string :as str]))

(defn normalize [word]
  (sort (str/lower-case word)))

(defn anagrams-for [word prospect-list]
  (let [sorted (normalize word)]
    (filter
     #(and 
       (not= (str/lower-case word) (str/lower-case %))
       (= sorted (normalize %)))
     prospect-list)))