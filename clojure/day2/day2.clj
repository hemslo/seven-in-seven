; Implement an unless with an else condition using macros.

(defmacro unless [test body & [elsebody]]
        (list 'if (list 'not test) body elsebody))

; Write a type using defrecord that implements a protocol.
(defprotocol Quack (quack [this] "Method to quack") )
(defrecord Duck [name] Quack (quack [this] (str (:name this) " Quaaaaaack!")))
