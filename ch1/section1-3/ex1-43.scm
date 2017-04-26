;;;; Exercise 1.43
;;;;
;;;; $ csi -s ex1-43.scm

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))

(print ((repeated square 2) 5))
