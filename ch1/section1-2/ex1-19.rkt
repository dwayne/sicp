#lang racket

;;;; Exercise 1.19

; Let a_0, b_0 be the starting pair.
;
; After the 1st transformation we have:
; a_1 = b_0 * q + a_0 * q + a_0 * p
; b_1 = b_0 * p + a_0 * q
;
; After the 2nd transformation we have:
; a_2 = b_1 * q + a_1 * q + a_1 * p
; b_2 = b_1 * p + a_1 * q
;
; Substituting for a_1, b_1 and simplifying we get:
; a_2 = b_0 * (2pq + q^2) + a_0 * (2pq + q^2) + a_0 * (p^2 + q^2)
; b_2 = b_0 * (p^2 + q^2) + a_0 * (2pq + q^2)
;
; Hence, p' = p^2 + q^2 and q' = 2pq + q^2.

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(= (fib 0) 0)
(= (fib 1) 1)
(= (fib 2) (+ (fib 0) (fib 1)))
(= (fib 3) (+ (fib 1) (fib 2)))
(= (fib 4) (+ (fib 2) (fib 3)))
(= (fib 5) (+ (fib 3) (fib 4)))


(list (fib 0)
      (fib 1)
      (fib 2)
      (fib 3)
      (fib 4)
      (fib 5)
      (fib 6)
      (fib 7)
      (fib 8)
      (fib 9)
      (fib 10))
