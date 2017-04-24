;;;; Exercise 1.28
;;;;
;;;; $ csi -s ex1-28.scm

; Alternate form of Fermat's Little Theorem:
;
; If n is prime then a^(n-1) is congruent to 1 modulo n for all 1 <= a < n.
;
; Examples:
;
; n  a  a^(n-1)     a^(n-1) mod n
; 2  1  1^1 = 1     1
; 3  2  2^2 = 4     1
; 5  4  4^4 = 256   1
;    3  3^4 = 81    1
;    2  2^4 = 16    1

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; NOTE: I didn't have to modify the return value of expmod as the exercise
; suggested. Why was it suggested? Am I missing something?

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

; Known composites
(print "Testing known composites...")
(print (fast-prime? 4 100))
(print (fast-prime? 8 100))
(print (fast-prime? 16 100))
(print (fast-prime? 18 100))
(print (fast-prime? 25 100))
(print (fast-prime? 64 100))
(print (fast-prime? 81 100))
(print (fast-prime? 91 100))
(print (fast-prime? 99 100))

; Known primes
(print "Testing known primes...")
(print (fast-prime? 2 100))
(print (fast-prime? 3 100))
(print (fast-prime? 5 100))
(print (fast-prime? 7 100))
(print (fast-prime? 11 100))
(print (fast-prime? 13 100))
(print (fast-prime? 17 100))
(print (fast-prime? 19 100))
(print (fast-prime? 23 100))
(print (fast-prime? 29 100))
(print (fast-prime? 31 100))
(print (fast-prime? 37 100))

; Carmichael numbers
(print "Testing Carmichael numbers...")
(print (fast-prime? 561 10000))
(print (fast-prime? 1105 10000))
(print (fast-prime? 1729 10000))
(print (fast-prime? 2465 10000))
(print (fast-prime? 2821 10000))
(print (fast-prime? 6601 10000))
