#lang planet neil/sicp

(define (reverse items)
  (if (or (null? items) (null? (cdr items)))
      items
      (append (reverse (cdr items)) (list (car items)))))
