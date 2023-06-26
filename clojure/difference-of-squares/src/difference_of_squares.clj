(ns difference-of-squares)

(defn sum-of-squares [n]
  (reduce + (map #(* % %) (range 1 (inc n)))))

(defn square-of-sum [n]
  (let [sum (reduce + (range 1 (inc n)))]
    (* sum sum)))

(defn difference [n]
  (- (square-of-sum n) (sum-of-squares n)))


