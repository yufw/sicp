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

;; ��Ϊ good-enough? ���õ���ĳ����ʽ�ľ��������ں�С����������
;; ���ܼ������ȷ�𰸡����ںܴ���������������ܴ�����Ĳ�ܱ�������
;; ��ȷ��ʾ���ᵼ�³���������ѭ����

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

;; ���ں�С������ʹ����� good-enough? ʵ�ֵ� sqrt ���Լ�����ȽϺõ�
;; �𰸡������Դ����������ľ��������֮ǰ�İ汾����
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
