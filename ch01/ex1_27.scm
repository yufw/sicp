#lang planet neil/sicp

(define (carmichael? n)
  (test 1 n))

(define (test a n)
  (cond ((= a n) true)
        ((= (expmod a n n) a) (test (+ 1 a) n))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n)
  (* n n))
