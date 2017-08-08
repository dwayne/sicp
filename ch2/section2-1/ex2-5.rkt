#lang racket

;;;; Exercise 2.5

;; We can represent pairs of nonnegative integers using only
;; numbers and arithmetic operations.
;;
;; (a, b) -> 2^a * 3^b

;; Assumes a >= 0 and b >= 0
(define (my-cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (my-car n)
  (define (iter m a)
    (if (= (remainder m 2) 0)
	(iter (/ m 2) (+ a 1))
	a))
  (iter n 0))

(define (my-cdr n)
  (define (iter m b)
    (if (= (remainder m 3) 0)
	(iter (/ m 3) (+ b 1))
	b))
  (iter n 0))

(= (my-car (my-cons 1 2)) 1)
(= (my-cdr (my-cons 1 2)) 2)
