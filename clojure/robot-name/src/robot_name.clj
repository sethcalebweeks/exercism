(ns robot-name)

(defn generate-name []
  (apply str (concat
        (repeatedly 2 #(rand-nth "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
        (repeatedly 3 #(rand-int 10)))))

(defn robot []
  (atom (generate-name)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (swap! robot (fn [_] (generate-name))))