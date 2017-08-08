#lang racket

;;;; Exercise 2.2

;; Points

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; Line segments

(define (make-segment p q) (cons p q))
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; Midpoint of a line segment

(define (midpoint-segment l)
  (make-point (/ (+ (x-point (start-segment l))
		    (x-point (end-segment l)))
		 2)
	      (/ (+ (y-point (start-segment l))
		    (y-point (end-segment l)))
		 2)))

;; Printing points

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

;; Examples

(print-point (midpoint-segment (make-segment (make-point 1 3)
					     (make-point 1 7))))
;; (1,5)

(print-point (midpoint-segment (make-segment (make-point 2 15)
					     (make-point 18 15))))
;; (10,15)

(print-point (midpoint-segment (make-segment (make-point -1 -2)
					     (make-point 5 8))))
;; (2,3)
