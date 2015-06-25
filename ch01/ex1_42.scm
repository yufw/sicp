#lang planet neil/sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square n) (* n n))
(define (inc n) (+ n 1))

((compose square inc) 6)
