(ns matching-brackets)

(defn validate [string, stack]
  (if (empty? string)
    (if (empty? stack)
      true
      false)
    (let [[first-char & rest] string
          [top & bottom] stack]
      (cond
        (and (= first-char \}) (= top \{)) (validate rest bottom)
        (and (= first-char \]) (= top \[)) (validate rest bottom)
        (and (= first-char \)) (= top \()) (validate rest bottom)
        (#{\{ \[ \( \} \] \)} first-char) (validate rest (cons first-char stack))
        :else (validate rest stack)))))

(defn valid? [string] 
  (validate string []))