#lang planet neil/sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (if (not (= 0 (remainder x 2)))
      0
      (+ 1 (car (/ x 2)))))

(define (cdr x)
  (if (not (= 0 (remainder x 3)))
      0
      (+ 1 (car (/ x 3)))))
