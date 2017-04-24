;;;; Exercise 1.24
;;;;
;;;; $ csi -s ex1-24.scm

(require-extension micro-benchmark)
; I need microsecond timing which the above library provides.
; See http://wiki.call-cc.org/eggref/4/micro-benchmark for usage details.

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
      (report-prime (benchmark-measure (fast-prime? n 1)))
      (newline)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

; Timing is in microseconds

; smallest 3 primes > 1000
(timed-prime-test 1009) ; 33
(timed-prime-test 1013) ; 14
(timed-prime-test 1019) ; 15

; smallest 3 primes > 10,000
(timed-prime-test 10007) ; 17
(timed-prime-test 10009) ; 16
(timed-prime-test 10037) ; 21

; smallest 3 primes > 100,000
(timed-prime-test 100003) ; 21
(timed-prime-test 100019) ; 27
(timed-prime-test 100043) ; 19

; smallest 3 primes > 1,000,000
(timed-prime-test 1000003) ; 25
(timed-prime-test 1000033) ; 22
(timed-prime-test 1000037) ; 22

; Conclusion:
;
; I took about twice as long (as expected) to test primes near 1,000,000 as
; it did to test primes near 1000.
