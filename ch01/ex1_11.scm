#lang planet neil/sicp

;; µÝ¹é°æ±¾
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* (f (- n 2)) 2)
         (* (f (- n 3)) 3))))

;; µü´ú°æ±¾
(define (g n)
  (g-iter 2 1 0 n))

(define (g-iter a b c count)
  (if (= count 0)
      c
      (g-iter (+ (* c 3) (* b 2) a) a b (- count 1))))
