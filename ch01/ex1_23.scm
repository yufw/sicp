#lang planet neil/sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

(define (search-for-primes n)
  (consecutive-primes n 3))

(define (consecutive-primes n count)
  (cond ((= count 0)
         (newline)
         (display "program exited"))
        ((prime? n)
         (timed-prime-test n)
         (consecutive-primes (next-odd n) (- count 1)))
        (else
         (consecutive-primes (next-odd n) count))))
