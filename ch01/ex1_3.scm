#lang planet neil/sicp

(define (sum-of-biggest-two x y z)
  (cond ((and (<= x y) (<= x z)) (+ y z))
        ((and (<= y x) (<= y z)) (+ x z))
        ((and (<= z x) (<= z y)) (+ x y))))

(sum-of-biggest-two 3 4 5)
(sum-of-biggest-two 5 3 4)
(sum-of-biggest-two 4 5 3)
