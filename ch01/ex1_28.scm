(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (and (= 1 (remainder (square (expmod base (/ exp 2) m)) m))
                  (not (or (= (expmod base (/ exp 2) m) 1)
                           (= (expmod base (/ exp 2) m) (- m 1)))))
             0
             (remainder (square (expmod base (/ exp 2) m)) m)))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))
