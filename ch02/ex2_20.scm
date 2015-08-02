#lang planet neil/sicp

(define (same-parity . items)
  (define (f result ints)
    (cond ((null? ints) result)
          ((= (remainder (- (car result) (car ints)) 2) 0)
           (f (append result (list (car ints))) (cdr ints)))
          (else
           (f result (cdr ints)))))
  (f (list (car items)) (cdr items)))
