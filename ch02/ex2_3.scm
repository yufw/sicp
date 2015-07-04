#lang planet neil/sicp

(define (make-segment start end)
  (cons start end))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

;; 用两条相邻边表示
;(define (make-rect seg1 seg2)
;  (cons seg1 seg2))
;
;(define (length-rect rect)
;  (length-segment (car rect)))
;
;(define (width-rect rect)
;  (length-segment (cdr rect)))

;; 用三个点表示
(define (make-rect p0 p1 p2)
  (cons (make-segment p0 p1)
        (make-segment p0 p2)))

(define (length-rect rect)
  (length-segment (car rect)))

(define (width-rect rect)
  (length-segment (cdr rect)))

(define (perimeter-rect rect)
  (* (+ (length-rect rect)
        (width-rect rect))
     2))

(define (area-rect rect)
  (* (length-rect rect)
     (width-rect rect)))

(define (length-segment s)
  (sqrt (+ (square (- (x-point (start-segment s))
                      (x-point (end-segment s))))
           (square (- (y-point (start-segment s))
                      (y-point (end-segment s)))))))

(define (square x) (* x x))
