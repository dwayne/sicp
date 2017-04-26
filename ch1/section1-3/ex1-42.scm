;;;; Exercise 1.42
;;;;
;;;; $ csi -s ex1-42.scm

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(print ((compose square inc) 6))
