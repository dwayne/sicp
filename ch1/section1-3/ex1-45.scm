;;;; Exercise 1.45
;;;;
;;;; $ csi -s ex1-45.scm

;; Fixed points

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

;; Average damping

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

;; Repeated

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

;; 4th roots

(define (fourth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y))))
	       1.0))

;; 5th roots

(define (fifth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y))))
	       1.0))

;; 6th roots

(define (sixth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y))))
	       1.0))

;; 7th roots

(define (seventh-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y y))))
	       1.0))

;; 8th roots

(define (eighth-root x)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y y))))
	       1.0))

;; 9th roots

(define (nineth-root x)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y y y))))
	       1.0))

;; 10th roots

(define (tenth-root x)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y y y y))))
	       1.0))

;; ...

;; 15th roots

(define (fifteenth-root x)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y y y y y y y y y))))
	       1.0))

;; 16th roots
(define (sixteenth-root x)
  (fixed-point ((repeated average-damp 4) (lambda (y) (/ x (* y y y y y y y y y y y y y y y))))
	       1.0))

(print "Experiments:")
(print (fourth-root 16))
(print (fifth-root 32))
(print (sixth-root 64))
(print (seventh-root 128))
(print (eighth-root 256))
(print (nineth-root 512))
(print (tenth-root 1024))
(print (fifteenth-root 32768))
(print (sixteenth-root 65536))

;; Suppose we want to compute the nth root. Let 2^m <= n < 2^(m+1) for some m >= 1.
;; For e.g.
;;
;; n   m   2^m   2^(m+1)
;; 2   1   2     4
;; 3   1   2     4
;; 4   2   4     8
;; 5   2   4     8
;; 6   2   4     8
;; 7   2   4     8
;; 8   3   8     16
;; 9   3   8     16
;; 10  3   8     16
;; ...
;; 15  3   8     16
;; 16  4   16    32

(define (nth-root n)
  (define (log2 x)
    (/ (log x) (log 2)))
  (define (ifloor x)
    (inexact->exact (floor x)))
  (lambda (x)
    (let ((times (ifloor (log2 n))))
      (fixed-point ((repeated average-damp times) (lambda (y) (/ x (expt y (- n 1)))))
		   1.0))))

(print "Tests:")
(print ((nth-root 2) 4))
(print ((nth-root 3) 8))
(print ((nth-root 4) 16))
(print ((nth-root 5) 32))
(print ((nth-root 6) 64))
(print ((nth-root 7) 128))
(print ((nth-root 8) 256))
(print ((nth-root 9) 512))
(print ((nth-root 10) 1024))
(print ((nth-root 15) 32768))
(print ((nth-root 16) 65536))
(print ((nth-root 31) 2147483648))
(print ((nth-root 32) 4294967296))
