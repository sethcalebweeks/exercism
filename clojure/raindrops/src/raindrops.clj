(ns raindrops
  (:require [clojure.string :as str]))

(defn defsound [sound factor]
  (let [fn-name (symbol sound)] 
    (intern *ns* fn-name  
     (fn [n] (if (= 0 (mod n factor)) (str/capitalize sound) "")))))

(defsound "pling" 3)
(defsound "plang" 5)
(defsound "plong" 7)

(defn convert [n]
  (let [factors (str/join (map #(% n) [pling plang plong]))]
    (if (empty? factors) (str n) factors)))