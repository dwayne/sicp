#lang sicp

;;;; Exercise 1.46

;; Iterative improvement

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

;; Rewrite of the sqrt procedure of section 1.1.7

(define (sqrt x)
  (let ((tolerance 0.001))
    ((iterative-improve (lambda (guess)
                          (< (abs (- (square guess) x)) tolerance))
                        (lambda (guess)
                          (average guess (/ x guess))))
     1.0)))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(display "sqrt:")
(newline)
(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

;; Rewrite of the fixed-point procedure of section 1.3.3

;; NOTE:
;; This isn't quite the same since the other version
;; would have returned (f guess) and not guess when
;; the guess was deemed good enough.
;;
;; However, based on the signature of iterative-improve
;; I see no way of getting the original version.
(define (fixed-point f first-guess)
  (let ((tolerance 0.00001))
    ((iterative-improve (lambda (guess)
                          (< (abs (- guess (f guess))) tolerance))
                        f)
     first-guess)))

(display "Fixed points:")
(newline)
(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

(define (fixed-point-sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(display "sqrt from fixed points:")
(newline)
(fixed-point-sqrt 4)
(fixed-point-sqrt 9)
(fixed-point-sqrt 16)
