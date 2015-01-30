#lang planet neil/sicp

;; 如果解释器采用应用序求值，则解释器会陷入死循环。
;; 如果解释器采用正则序求值，则解释器会返回0。
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
