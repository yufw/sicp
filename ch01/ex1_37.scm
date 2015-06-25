#lang planet neil/sicp

(define (cont-frac n d k)
  (define (helper n d depth count)
    (if (= count 1)
        (/ (n depth) (d depth))
        (/ (n depth)
           (+ (d depth) (helper n d (+ depth 1) (- count 1))))))
  (helper n d 1 k))

;; kȡ11��ʹ����ֵ����ʮ���Ƶ�4λ����
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;; �����汾
(define (cont-frac2 n d k)
  (define (iter result count)
    (if (= count 0)
        result
        (iter (/ (n count)
                 (+ (d count) result))
              (- count 1))))
  (iter 0 k))

(cont-frac2 (lambda (i) 1.0)
            (lambda (i) 1.0)
            11)
