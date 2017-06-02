#lang sicp

;;;; Exercise 1.24

(#%require math/base)

(define (random n)
  (random-natural n))

;;;; The Fermat test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

;;;; Timed prime test

; I'm not sure how many times to run the Fermat test.
(define (timed-prime-test n)
  (display n)
  (if (fast-prime? n 1)
      (report-prime (measure fast-prime? n 1))
      (newline)))

(define (measure proc x y)
  (let ((start (runtime)))
    (proc x y)
    (- (runtime) start)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

; smallest 3 primes > 1000
(timed-prime-test 1009) ; 5
(timed-prime-test 1013) ; 2
(timed-prime-test 1019) ; 2

; smallest 3 primes > 10,000
(timed-prime-test 10007) ; 3
(timed-prime-test 10009) ; 3
(timed-prime-test 10037) ; 3

; smallest 3 primes > 100,000
(timed-prime-test 100003) ; 3
(timed-prime-test 100019) ; 3
(timed-prime-test 100043) ; 3

; smallest 3 primes > 1,000,000
(timed-prime-test 1000003) ; 3
(timed-prime-test 1000033) ; 3
(timed-prime-test 1000037) ; 4

; Conclusion:
;
; I took relatively no time to test primes near 1,000,000 as
; it did to test primes near 1000.
