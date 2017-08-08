#lang racket

;;;; Exercise 1.29
;;;;
;;;; Simpson's Rule

; f    - an integrable function
; a, b - the interval within which f is integrated with a <= b
; n    - an even integer
(define (integrate f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term i)
    (* (cond ((or (= i 0) (= i n)) 1)
             ((even? i) 2)
             (else 4))
       (y i)))
  (define (next i)
    (+ i 1))
  (* (/ h 3)
     (sum term 0 next n)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; Test

(define (cube x) (* x x x))

(integrate cube 0 1 100)
(integrate cube 0 1 1000)
