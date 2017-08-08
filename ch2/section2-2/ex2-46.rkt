#lang racket

;;;; Exercise 2.46

(define (make-vect x y) (cons x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cdr v))

;; Example

(define u (make-vect 3 4))
(= (xcor-vect u) 3)
(= (ycor-vect u) 4)

;; Vector operations

(define (add-vect u v)
  (make-vect (+ (xcor-vect u) (xcor-vect v))
             (+ (ycor-vect u) (ycor-vect v))))

(equal? (add-vect (make-vect 1 2) (make-vect 3 4))
   (make-vect 4 6))

(define (sub-vect u v)
  (make-vect (- (xcor-vect u) (xcor-vect v))
             (- (ycor-vect u) (ycor-vect v))))

(equal? (sub-vect (make-vect 3 4) (make-vect 1 2))
   (make-vect 2 2))

(define (scale-vect k u)
  (make-vect (* k (xcor-vect u))
             (* k (ycor-vect u))))

(equal? (scale-vect 5 (make-vect 1 2))
        (make-vect 5 10))