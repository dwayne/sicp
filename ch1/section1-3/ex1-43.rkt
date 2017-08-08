#lang racket

;;;; Exercise 1.43

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))

(= ((repeated square 2) 5) 625)
