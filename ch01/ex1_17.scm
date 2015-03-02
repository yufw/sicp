#lang planet neil/sicp

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul (double a) (halve (- b 1)))))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
