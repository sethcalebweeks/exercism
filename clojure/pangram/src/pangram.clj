(ns pangram 
  (:require [clojure.string :as str]))

(defn pangram? [s]
  (= 26 (count (filter #(Character/isLetter %) (reduce conj #{} (str/lower-case s))))))
