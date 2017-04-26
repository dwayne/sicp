;;;; Exercise 1.44
;;;;
;;;; $ csi -s ex1-44.scm

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
	     (f x)
	     (f (+ x dx)))))

(define (average x y z)
  (/ (+ x y z) 3))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))

(print ((smooth square) 5))
(print ((n-fold-smooth square 1) 5))
(print ((n-fold-smooth square 2) 5))
