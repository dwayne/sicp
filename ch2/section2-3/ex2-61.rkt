#lang racket

;;;; Exercise 2.61

(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (let ((y (car set)))
        (if (<= x y) ; on average x will be <= half of the elements of set
            (cons x set)
            (cons y (adjoin-set x (cdr set)))))))

(adjoin-set 2 '())
(adjoin-set 4 '(2))
(adjoin-set 6 '(2 4))
(adjoin-set 1 '(2 4 6))
(adjoin-set 3 '(2 4 6))
(adjoin-set 5 '(2 4 6))