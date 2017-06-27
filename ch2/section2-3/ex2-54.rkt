#lang sicp

;;;; Exercise 2.54

(define (my-equal? a b)
  (if (and (pair? a) (pair? b))
      (and (my-equal? (car a) (car b))
           (my-equal? (cdr a) (cdr b)))
      (eq? a b)))

;; Examples

(my-equal? '(this is a list)
           '(this is a list))

(my-equal? '(this is a list)
           '(this (is a) list))