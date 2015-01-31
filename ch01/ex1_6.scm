#lang planet neil/sicp

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; new-if 是一个常规过程，如果解释器采用正则序求值，使用 new-if 代替
;; if 会使解释器对表达式进行无穷递归展开，程序不能正常运行。如果解释器
;; 采用应用序求值，则解释器会对表达式进行无穷递归计算。if 是特殊形式，
;; 它会根据 predicate 的求值结果选择一条分支展开或计算，这样就不会产生
;; 无穷递归的问题。
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt 2.0)
