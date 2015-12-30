; Use refs to create a vector of accounts in memory. Create debit and credit functions to change the balance of an account.
(def accounts (ref [0 0 0]))

(defn balance
  [accounts index]
  (nth @accounts index))

(defn debit
  [accounts index amount]
  (dosync (alter accounts assoc index (- (balance accounts index) amount))))

(defn credit
  [accounts index amount]
  (dosync (alter accounts assoc index (+ (balance accounts index) amount))))
