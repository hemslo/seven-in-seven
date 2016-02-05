(ns day1.core)
(use 'clojure.core.logic)

; Try running a logic program that has two membero goals, both with q as the first argument. What happens when the same element exists in both collections?
(run* [q] (membero q [1 2 3]) (membero q [3 4 5]))

; appendo is a core.logic built-in that will append two lists. Write some logic programs similar to the membero examples to get a feel for how it works. Be sure to use q in each of the three argument positions to see what happens.
(run* [q] (appendo q [2 3] [1 2 3]))
(run* [q] (appendo [1] q [1 2 3]))
(run* [q] (appendo [1] [2 3] q))

; Create languageo and systemo database relations and add the relevant facts based on which category best classifies the person’s work.
(use 'clojure.core.logic.pldb)
(db-rel mano x)
(db-rel womano x)
(def facts
  (db
    [mano :alan-turing]
    [womano :grace-hopper]
    [mano :leslie-lamport]
    [mano :alonzo-church]
    [womano :ada-lovelace]
    [womano :barbara-liskov]
    [womano :frances-allen]
    [mano :john-mccarthy]))

(db-rel vitalo p s)
(db-rel turingo p y)
(def facts
  (-> facts
    (db-fact vitalo :alan-turing :dead)
    (db-fact vitalo :grace-hopper :dead)
    (db-fact vitalo :leslie-lamport :alive)
    (db-fact vitalo :alonzo-church :dead)
    (db-fact vitalo :ada-lovelace :dead)
    (db-fact vitalo :barbara-liskov :alive)
    (db-fact vitalo :frances-allen :alive)
    (db-fact vitalo :john-mccarthy :dead)
    (db-fact turingo :leslie-lamport :2013)
    (db-fact turingo :barbara-liskov :2008)
    (db-fact turingo :frances-allen :2006)
    (db-fact turingo :john-mccarthy :1971)))

(db-rel languageo p l)
(db-rel systemo p s)
(def facts
  (-> facts
    (db-fact languageo :grace-hopper :cobol)
    (db-fact languageo :barbara-liskov :clu)
    (db-fact languageo :barbara-liskov :argus)
    (db-fact languageo :john-mccarthy :lisp)
    (db-fact systemo :alan-turing :turing-machine)))

(with-db facts
  (run* [q]
    (languageo q :lisp)))

(with-db facts
  (run* [q]
    (fresh [p l]
      (womano p)
      (languageo p l)
      (== q [p l]))))

; Use conde to create scientisto, which succeeds for any of the men or women.
(defn scientisto [q]
  (conde
    [(mano q)]
    [(womano q)]))

(with-db facts
  (run* [q]
    (scientisto q)))

; Construct a logic program that finds all scientists who’ve won Turing Awards.
(with-db facts
  (run* [q]
    (fresh [p y]
      (turingo p y)
      (== q [p y]))))
