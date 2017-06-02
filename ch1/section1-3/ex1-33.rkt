#lang sicp

;;;; Exercise 1.33

(define (filtered-accumulate pred? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (pred? a)
                  (combiner result (term a))
                  result))))
  (iter a null-value))

; a.

; Computes the sum of the squares of the prime numbers in the interval a to b
(define (sum-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

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

; b.

; Computes the product of all the positive integers less than n that are
; relatively prime to n
(define (product-of-relative-primes n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate relatively-prime? * 1 id 1 inc (- n 1)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Helpers

(define (id x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))

; Test

; 2^2 + 3^2 + 5^2 + 7^2 = 4 + 9 + 25 + 49 = 87
(= (sum-squares-of-primes 2 10) 87)

; For n = 8
; 1, 3, 5, 7 are relatively prime to 8
; 1 * 3 * 5 * 7 = 3 * 35 = 105
(= (product-of-relative-primes 8) 105)
