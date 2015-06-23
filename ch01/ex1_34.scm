(define (f g)
  (g 2))

(f square)                              ; => 4
(f (lambda (z) (* z (+ z 1))))          ; => 6

;; 如果我们要求解释器去求值 (f f)，解释器会试图求值 (2 2)，于是出现错
;; 误（The object 2 is not applicable）。
