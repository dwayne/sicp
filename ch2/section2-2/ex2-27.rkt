#lang sicp

;;;; Exercise 2.27

(define (deep-reverse xs)
  (define (iter xs result)
    (if (null? xs)
        result
        (let ((x (car xs)))
          (iter (cdr xs)
                (cons (if (pair? x)
                          (iter x nil)
                          x)
                      result)))))
  (iter xs nil))

(deep-reverse nil)
(deep-reverse (list 1))
(deep-reverse (list 1 2))
(deep-reverse (list 1 2 3 4 5))
(deep-reverse (list (list 1 2) (list 3 4)))
(deep-reverse (list nil (list 1) (list 1 2) (list (list 1 2) (list 3 4))))