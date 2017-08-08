#lang racket

;;;; Exercise 2.3

;; Points

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; Rectangle

;;             q
;; ------------*
;; |           |
;; |           |
;; |           |
;; *------------
;; p
;(define (make-rectangle p q) (cons p q))

;(define (length-rectangle r)
;  (abs (- (x-point (car r))
;	  (x-point (cdr r)))))

;(define (width-rectangle r)
;  (abs (- (y-point (car r))
;	  (y-point (cdr r)))))

;; Alternative rectangle representation

;;   -------------
;;   |           |
;; w |           |
;;   |           |
;;   *------------
;;   p     l
(define (make-rectangle p l w) (cons p (cons l w)))

(define (length-rectangle r) (cadr r))

(define (width-rectangle r) (cddr r))

;; Perimeter and area

(define (perimeter r)
  (* 2
     (+ (length-rectangle r)
	(width-rectangle r))))

(define (area r)
  (* (length-rectangle r)
     (width-rectangle r)))

;; Examples

;(define r1 (make-rectangle (make-point 0 0) (make-point 5 3)))
(define r1 (make-rectangle (make-point 0 0) 5 3))

(= (perimeter r1) 16)
(= (area r1) 15)
