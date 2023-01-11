(ns interest-is-interesting)

(defn interest-rate
  "TODO: add docstring"
  [balance]
  (cond
    (< balance 0) (double -3.213)
    (< balance 1000) (double 0.5)
    (< balance 5000) (double 1.621)
    (>= balance 5000) (double 2.475))
  )

(defn annual-balance-update
  "TODO: add docstring"
  [balance]
  (bigdec (* balance (+ (bigdec 1) (/ (abs (bigdec (interest-rate balance))) (bigdec 100)))))
  )

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (max 0 (int (Math/floor (* tax-free-percentage 0.02 balance))))
  )