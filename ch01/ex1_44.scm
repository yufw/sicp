#lang planet neil/sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (lambda (x)
    (let ((dx 0.01))
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))

(define (repeated-smooth n)
  (repeated smooth n))

(define (square x) (* x x))

((smooth square) 3)

(((repeated-smooth 2) square) 3)
