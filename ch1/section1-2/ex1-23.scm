;;;; Exercise 1.23
;;;;
;;;; $ csi -s ex1-23.scm

(require-extension micro-benchmark)
; I need microsecond timing which the above library provides.
; See http://wiki.call-cc.org/eggref/4/micro-benchmark for usage details.

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
      (report-prime (benchmark-measure (prime? n)))
      (newline)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

; Timing is in microseconds

; smallest 3 primes > 1000
(timed-prime-test 1009) ; 15
(timed-prime-test 1013) ; 26
(timed-prime-test 1019) ; 15

; smallest 3 primes > 10,000
(timed-prime-test 10007) ; 46
(timed-prime-test 10009) ; 46
(timed-prime-test 10037) ; 46

; smallest 3 primes > 100,000
(timed-prime-test 100003) ; 152
(timed-prime-test 100019) ; 151
(timed-prime-test 100043) ; 149

; smallest 3 primes > 1,000,000
(timed-prime-test 1000003) ; 463
(timed-prime-test 1000033) ; 462
(timed-prime-test 1000037) ; 448

; Using (define (next-divisor) (+ divisor 1)) and timing we get
;
; 1009 *** 25
; 1013 *** 25
; 1019 *** 29
; 10007 *** 87
; 10009 *** 82
; 10037 *** 85
; 100003 *** 277
; 100019 *** 268
; 100043 *** 264
; 1000003 *** 816
; 1000033 *** 811
; 1000037 *** 796

; Conclusion:
;
; I reduced the number of test divisors by half and
; the tests ran about 2 times faster as expected.
