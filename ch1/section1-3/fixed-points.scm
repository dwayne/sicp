;;;; Finding fixed points of functions
;;;;
;;;; $ csi -s fixed-points.scm

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

;; Examples

(print (fixed-point cos 1.0))
(print (fixed-point (lambda (y) (+ (sin y) (cos y)))
		    1.0))

(define (sqrt x)
  (define (average x y) (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0))

(print (sqrt 2))
(print (sqrt 4))
(print (sqrt 9))
