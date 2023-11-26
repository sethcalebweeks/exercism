(ns leap)

(defn leap-year? [year]
  (or
    (= 0 (mod year 400))
    (and 
      (= 0 (mod year 4))
      (not= 0 (mod year 100))))
)
