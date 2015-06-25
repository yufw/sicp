#lang planet neil/sicp

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (square x)
    (* x x))
  (define (average x y)
    (/ (+ x y) 2))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) 1.0))
