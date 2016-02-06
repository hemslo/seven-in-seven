(ns day2.core)
(use 'clojure.core.logic)

; Rewrite extendo from Day 1’s problems using matche or defne.
(defne exptendo [x y z]
  ([() _ y])
  ([[a . d] _ [a . r]] (extendo d y r)))

; Create a goal not-rooto which takes a map with a :username key and succeeds only if the value is not “root”.
(defn non-rooto [dict]
  (fresh [v]
    (featurec dict {:username, v}) (!= v "root")))

; Run whicho in reverse, asking for elements in one or both of the sets.
; Add a :none branch to whicho. What happens when you use the :none branch in the whicho version built on conde?
(defn whicho [x s1 s2 r]
  (conda
    [(all
      (membero x s1)
      (membero x s2)
      (== r :both))]
    [(all
      (membero x s1)
      (== r :one))]
    [(all
      (membero x s2)
      (== r :two))]
    [(== r :none)]))

(run* [q] (whicho q [:a :b :c] [:d :e :c] :one))
(run* [q] (whicho q [:a :b :c] [:d :e :c] :both))


; Play with (insideo :a [:a :b :a]). How many times does it succeed? Make it succeed only once but have (insideo q [:a :b :a]) return all distinct elements. Hint: Try using the != constraint.
(defne insideo [e l]
  ([_ [e . tail]])
  ([_ [head . tail]]
    (!= e head)
    (insideo e tail)))
(run* [q] (insideo q [:a :b :a]))
