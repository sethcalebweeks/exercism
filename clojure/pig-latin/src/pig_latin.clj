(ns pig-latin 
  (:require [clojure.string :as str]))

(defn words [phrase] (str/split phrase #" "))

(defn vowel [[first :as word]]
  (if (some #{first} "aeiou") (str word "ay") false))

(defn yt-xr [[first second :as word]]
  (if (or (and (= first \y) (= second \t))
          (and (= first \x) (= second \r))) (str word "ay") false))

(defn y [[first & rest]]
  (if (= \y first) (apply str (flatten [rest first "ay"])) false))

(defn consonants [word]
  (let [cluster (take-while #(not (some #{%} "aeiouy")) word)
        q-before-u? (and (= \q (last cluster)) (= \u (nth word (count cluster))))
        cluster (if q-before-u? (flatten [cluster \u]) cluster)
        rest (drop (count cluster) word)]
    (apply str (flatten [rest cluster "ay"]))))

(defn translate-word [word] 
  (str (some identity (map #(% word) [vowel yt-xr y consonants]))))

(defn translate [phrase]
  (str/join " " (map translate-word (words phrase)))
  )