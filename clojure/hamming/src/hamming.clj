(ns hamming)

(defn distance [strand1 strand2]
  (cond
    (not= (count strand1) (count strand2)) nil
    :else (count (filter #(not %) (map #(= %1 %2) strand1 strand2)))))