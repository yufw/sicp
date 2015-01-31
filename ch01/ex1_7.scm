#lang planet neil/sicp

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; 因为 good-enough? 采用的是某种形式的绝对误差，对于很小的数，程序并
;; 不能计算出正确答案。对于很大的数，由于两个很大的数的差不能被解释器
;; 正确表示，会导致程序陷入死循环。

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

;; 对于很小的数，使用这个 good-enough? 实现的 sqrt 可以计算出比较好的
;; 答案。对于稍大的数，结果的绝对误差会比之前的版本更大。
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
