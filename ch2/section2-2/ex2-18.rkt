#lang sicp

;;;; Exercise 2.18

(define (reverse xs)
  (define (iter xs result)
    (if (null? xs)
        result
        (iter (cdr xs) (cons (car xs) result))))
  (iter xs nil))

(reverse (list 1 4 9 16 25))
(reverse nil)
(reverse (list 1))
(reverse (list 1 2))