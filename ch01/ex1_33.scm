#lang planet neil/sicp

(define (filtered-accumulate combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (combiner (if (predicate (term a)) (term a) null-value)
                (filtered-accumulate combiner null-value term (next a) next b predicate))))

(define (identity x) x)

(define (inc n) (+ n 1))

;; 求出在区间a到b中所有素数之和
(define (sum-primes a b)
  (filtered-accumulate + 0 identity a inc b prime?))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

;; 小于n的所有与n互素的正整数之乘积
(define (product-coprime n)
  (filtered-accumulate * 1 identity 1 inc (- n 1) (coprime? n)))

(define (coprime? n)
  (define (coprime-to? i)
    (= 1 (gcd i n)))
  coprime-to?)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
