#lang sicp

;;;; Exercise 2.6

;; Church numerals

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; A direct definition of one and two

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; A direct definition of addition

;; Let's see what n + 2 and n + 3 might look like:
(define (add-2 n)
  (lambda (f) (lambda (x) (f (f ((n f) x))))))

(define (add-3 n)
  (lambda (f) (lambda (x) (f (f (f ((n f) x)))))))

;; Now, if m is a Church numeral then
;; (m f) => (lambda (x) (f (f ... (f x) ...))) i.e. apply f m-times to x

;; n + m
(define (add n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

;; Let's interpret the numerals and see if our definitions are correct:

(define (inc x) (+ x 1))

(= ((zero inc) 0) 0)
(= ((one inc) 0) 1)
(= ((two inc) 0) 2)
(= (((add-3 two) inc) 0) 5)
(= (((add (add (add two two) two) (add zero one)) inc) 0) 7)
(= (((add one zero) inc) 0) 1)
