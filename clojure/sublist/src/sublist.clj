(ns sublist)

(defn sublist? [list1 list2]
      (some #(= list1 %) (cons [] (partition (count list1) 1 list2)))
  )

(defn classify [list1 list2] ;; <- arglist goes here
      (def is-sublist (sublist? list1 list2))
      (def is-superlist (sublist? list2 list1))
      (cond
        (and is-sublist is-superlist) :equal
        is-sublist :sublist
        is-superlist :superlist
        :else :unequal)
  )