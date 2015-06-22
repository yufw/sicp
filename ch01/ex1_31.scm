#lang planet neil/sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (factorial n)
  (product identity 1 inc n))

(define (pi-product a b)
  (define (pi-term x)
    (* (/ (- x 1) x)
       (/ (+ x 1) x)))
  (define (pi-next x)
    (+ x 2))
  (product pi-term a pi-next b))

(* 4 (pi-product 3 1000))

;; µü´ú°æ±¾
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
