#lang planet neil/sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

(define (search-for-primes n)
  (consecutive-primes n 3))

(define (consecutive-primes n count)
  (cond ((= count 0)
         (newline)
         (display "program exited"))
        ((fast-prime? n 100)
         (timed-prime-test n)
         (consecutive-primes (next-odd n) (- count 1)))
        (else
         (consecutive-primes (next-odd n) count))))

(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
