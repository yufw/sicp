(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; 不用平均阻尼
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             2.0)

;; 采用平均阻尼时，近似值序列收敛更快，计算步数更少
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2))
             2.0)
