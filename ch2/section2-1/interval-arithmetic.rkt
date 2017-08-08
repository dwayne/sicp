#lang racket

;;;; Interval Arithmetic

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Exercise 2.7

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

; Exercise 2.8

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

; Exercise 2.9

;(define (width i)
;  (/ (- (upper-bound i) (lower-bound i))
;     2.0))

;; See notebook for answer

; Exercise 2.10

(define (div-interval-alt x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "interval spans 0")
      (div-interval x y)))

; Exercise 2.11
; To be completed

;; Alternate constructor and selectors

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; Exercise 2.12

(define (make-center-percent c p)
  ; c - center
  ; p - percent tolerance
  (make-center-width c (* c (/ p 100))))

(define (percent i)
  (let ((c (center i))
        (w (width i)))
    (/ (* w 100) c)))

; (make-center-percent 6.8 10)
; (percent (make-center-percent 6.8 10))

; Exercise 2.13

;; See notebook for answer

; Exercise 2.14

(define a (make-center-percent 10 0.5))
(define b (make-center-percent 8 0.25))

(define x (div-interval a a))
(define y (div-interval a b))

(define (show-interval x)
  (display "center: ")
  (display (center x))
  (display ", percent: ")
  (display (percent x))
  (newline))

(show-interval x)
(show-interval y)

; No major investigation was done since
; I'm really not that interested in
; digging into this problem further.