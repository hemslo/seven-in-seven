; In this section, I’m going to outline a single problem called sleeping barber. It was created by Edsger Dijkstra in 1965. It has these characteristics:
; • A barber shop takes customers.
; • Customers arrive at random intervals, from ten to thirty milliseconds.
; • The barber shop has three chairs in the waiting room.
; • The barber shop has one barber and one barber chair.
; • When the barber’s chair is empty, a customer sits in the chair, wakes up the barber, and gets a haircut.
; • If the chairs are occupied, all new customers will turn away.
; • Haircuts take twenty milliseconds.
; • After a customer receives a haircut, he gets up and leaves.
; Write a multithreaded program to determine how many haircuts a barber can give in ten seconds.

(def barber (agent 0))
(def empty-chairs (atom 3))
(def haircut-time 20)

(defn haircut
  [count]
  (swap! empty-chairs inc)
  (println "haircuting")
  (Thread/sleep haircut-time)
  (inc count)
  )

(defn customer-arrive
  []
  (if (= @empty-chairs 0)
    (println "No empty chairs")
    (do
      (println "Welcome")
      (swap! empty-chairs dec)
      (send barber haircut)
      )))

(defn open
  [time]
  (println "Open")
  (let [orig (System/currentTimeMillis)]
    (while (> time (- (System/currentTimeMillis) orig))
      (Thread/sleep (+ 10 (rand 20)))
      (customer-arrive))))

(defn start
  [time]
  (future (open time))
  (Thread/sleep time)
  @barber)

(start 10000)
