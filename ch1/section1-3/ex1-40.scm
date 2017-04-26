;;;; Exercise 1.40
;;;;
;;;; $ csi -s ex1-40.scm

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))
