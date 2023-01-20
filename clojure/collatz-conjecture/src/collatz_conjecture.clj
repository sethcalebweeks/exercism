(ns collatz-conjecture)

(defn collatz [num]
  (cond
    (= num 1) 0
    (even? num) (+ 1 (collatz (/ num 2)))
    :else (+ 1 (collatz (+ 1 (* num 3))))))
