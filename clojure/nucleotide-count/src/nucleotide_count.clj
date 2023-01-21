(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (cond
    (not (some #{nucleotide} "ACGT")) (throw nil)
    :else (count (filter #(= nucleotide %) strand))))


(defn nucleotide-counts [strand]
  (let [nucleotides "ACGT"
        counts (map #(count-of-nucleotide-in-strand % strand) nucleotides)]
    (cond
      (not= (apply + counts) (count strand)) (throw nil)
      :else (reduce #(assoc %1 %2 (inc (%1 %2))) {\A 0 \T 0 \C 0 \G 0} strand))))
