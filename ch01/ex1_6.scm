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

;; new-if ��һ��������̣����������������������ֵ��ʹ�� new-if ����
;; if ��ʹ�������Ա��ʽ��������ݹ�չ�����������������С����������
;; ����Ӧ������ֵ�����������Ա��ʽ��������ݹ���㡣if ��������ʽ��
;; ������� predicate ����ֵ���ѡ��һ����֧չ������㣬�����Ͳ������
;; ����ݹ�����⡣
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt 2.0)
