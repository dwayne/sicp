;;;; Exercise 1.36
;;;;
;;;; $ csi -s ex1-36.scm

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (print guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (print "Approximations:")
  (try first-guess))

;; Helpers

(define (average x y)
  (/ (+ x y) 2))

;; Without average damping

(print (fixed-point (lambda (x) (/ (log 1000) (log x)))
		    1.1))
;; Steps = 38

;; With average damping

(print (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
		    1.1))
;; Steps = 14
