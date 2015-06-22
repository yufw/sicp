#lang planet neil/sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (term j)
    (+ (f (+ a (* (- (* 2 j) 2) h)))
       (* 4 (f (+ a (* (- (* 2 j) 1) h))))
       (f (+ a (* (* 2 j) h)))))
  (* (sum term 1 inc (/ n 2))
     (/ h 3)))

; 注意浮点数误差

;(define (integral-simpson f a b n)
;  (define h (/ (- b a) n))
;  (define (sub-h x) (- x h))
;  (define (sub-2h x) (- x h h))
;  (define (add-2h x) (+ x h h))
;  (define (term x)
;    (+ (f x)
;       (* 4 (f (sub-h x)))
;       (f (sub-2h x))))
;  (* (sum term (add-2h a) add-2h b)
;     (/ h 3)))
