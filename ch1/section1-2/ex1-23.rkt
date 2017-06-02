#lang sicp

;;;; Exercise 1.23

;;;; Searching for divisors
;;;; Includes a small optimization where it only checks the divisors
;;;; 2, 3, 5, 7, 9, 11, ...

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

; (define (next divisor) (+ divisor 1))
(define (next divisor)
  (if (= divisor 2)
      3
      (+ divisor 2)))

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

; smallest 3 primes > 1000
(timed-prime-test 1009) ; 4
(timed-prime-test 1013) ; 2
(timed-prime-test 1019) ; 2

; smallest 3 primes > 10,000
(timed-prime-test 10007) ; 6
(timed-prime-test 10009) ; 6
(timed-prime-test 10037) ; 5

; smallest 3 primes > 100,000
(timed-prime-test 100003) ; 17
(timed-prime-test 100019) ; 16
(timed-prime-test 100043) ; 16

; smallest 3 primes > 1,000,000
(timed-prime-test 1000003) ; 51
(timed-prime-test 1000033) ; 50
(timed-prime-test 1000037) ; 50

; Using (define (next-divisor) (+ divisor 1)) and timing we get
;
; 1009 *** 5
; 1013 *** 3
; 1019 *** 3
; 10007 *** 10
; 10009 *** 10
; 10037 *** 10
; 100003 *** 30
; 100019 *** 31
; 100043 *** 30
; 1000003 *** 95
; 1000033 *** 95
; 1000037 *** 95

; Conclusion:
;
; I reduced the number of test divisors by half and
; the tests ran about 2 times faster as expected.
