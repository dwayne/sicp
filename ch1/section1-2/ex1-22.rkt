#lang sicp

;;;; Exercise 1.22

;;;; Prime test

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;;;; Timed prime test

(define (timed-prime-test n)
  (display n)
  (if (prime? n)
      (report-prime (measure prime? n))
      (newline)))

(define (measure proc x)
  (let ((start (runtime)))
    (proc x)
    (- (runtime) start)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

;;;; Search for primes

(define (search-for-primes low high)
  (define (search n)
    (cond ((<= n high)
           (timed-prime-test n)
           (search (+ n 2)))))
  (if (even? low)
      (search (+ low 1))
      (search low)))

; I expect each factor of 10 increase to cause the times to increase
; by a factor of 3 since (sqrt 10) is approximately equal to 3.

; The 3 smallest primes larger than 1000
; (search-for-primes 1000 1020)
; 1009 *** 4
; 1013 *** 3
; 1019 *** 3

; The 3 smallest primes larger than 10,000
; (search-for-primes 10000 10050)
; 10007 *** 10
; 10009 *** 8
; 10037 *** 8

; The 3 smallest primes larger than 100,000
; (search-for-primes 100000 100050)
; 100003 *** 27
; 100019 *** 25
; 100043 *** 25

; The 3 smallest primes larger than 1,000,000
; (search-for-primes 1000000 1000050)
; 1000003 *** 80
; 1000033 *** 81
; 1000037 *** 81

; The results are in line with my expectations. And, it seems that programs
; on my machine do run in time proportional to the number of steps required
; for the computation.
