(ns armstrong-numbers)

(defn exp "https://stackoverflow.com/a/5058544" [x n]
  (reduce * (repeat n x)))

(defn armstrong? [num] ;; <- arglist goes here
  (def number-string (str num))
  (= num (reduce 
               #(+ %1 (exp (read-string (str %2)) (count number-string)))
               0
               number-string))
)