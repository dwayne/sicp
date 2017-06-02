#lang sicp

;;;; Exercise 1.30
;;;;
;;;; A sum procedure that generates an iterative recursion.

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

; Test

(define (sum-integers a b)
  (define (id x) x)
  (define (inc x) (+ x 1))
  (sum id a inc b))

(sum-integers 1 10)
