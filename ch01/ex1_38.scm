#lang planet neil/sicp

(define (cont-frac n d k)
  (define (helper n d depth count)
    (if (= count 1)
        (/ (n depth) (d depth))
        (/ (n depth)
           (+ (d depth) (helper n d (+ depth 1) (- count 1))))))
  (helper n d 1 k))

(+ (cont-frac (lambda (i) 1.0)
              (lambda (i) (if (= (remainder i 3) 2)
                              (* (+ 1 (quotient i 3)) 2)
                              1))
              10)
   2)
