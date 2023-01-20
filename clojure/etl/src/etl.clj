(ns etl 
  (:require [clojure.string :as str]))

(defn reverse-map [new [count words]]
  (reduce #(merge %1 {(str/lower-case %2) count}) new words))

(defn transform [source]
  (reduce reverse-map {} source))