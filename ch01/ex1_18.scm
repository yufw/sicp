#lang planet neil/sicp

(define (fast-mul a b)
  (fast-mul-iter 0 a b))

(define (fast-mul-iter x a b)
  (cond ((= b 0) x)
        ((even? b) (fast-mul-iter x (double a) (halve b)))
        (else (fast-mul-iter (+ x a) a (- b 1)))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
