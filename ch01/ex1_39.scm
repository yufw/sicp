#lang planet neil/sicp

(define (cont-frac n d k)
  (define (helper n d depth count)
    (if (= count 1)
        (/ (n depth) (d depth))
        (/ (n depth)
           (+ (d depth) (helper n d (+ depth 1) (- count 1))))))
  (helper n d 1 k))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* i 2) 1))
             k))

(tan-cf 2.0 10)
