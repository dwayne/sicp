#lang racket

;;;; Exercise 2.1

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n (/ n g))
	  (d (/ d g)))
      (if (neg? d)
	  (cons (- n) (- d))
	  (cons n d)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (neg? x) (< x 0))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(print-rat (make-rat 2 4))
(print-rat (make-rat -2 4))
(print-rat (make-rat 2 -4))
(print-rat (make-rat -2 -4))
