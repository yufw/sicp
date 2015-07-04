#lang planet neil/sicp

;; gcd returns a nonnegative value.
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (< n 0) (< d 0)) (cons (- (/ n g)) (- (/ d g))))
          ((and (< n 0) (> d 0)) (cons (/ n g) (/ d g)))
          ((and (> n 0) (< d 0)) (cons (- (/ n g)) (- (/ d g))))
          ((and (> n 0) (> n 0)) (cons (/ n g) (/ d g))))))
