(ns all-your-base)

(defn exp [x n]
  (reduce * (repeat n x)))

(defn factors [num base]
  (reverse (for [digit (range)
                 :let [factor (exp base digit)]
                 :while (<= factor num)] factor)))

(defn digits [num factors]
  (cond
    (empty? factors) []
    :else (let [digit (unchecked-divide-int num (first factors))
                remainder (mod num (first factors))]
            (cons digit (digits remainder (rest factors))))))

(defn dec-to-base [num base]
  (digits num (factors num base)))

(defn base-to-dec [base num] (reduce #(+ %2 (* %1 base)) 0 num))

(defn convert [a num b]
  (cond
    (or (< a 2) (< b 2)) nil
    (empty? num) []
    (some #(or (>= % a) (< % 0)) num) nil
    (every? #(= % 0) num) [0] 
    :else (dec-to-base (base-to-dec a num) b)))
