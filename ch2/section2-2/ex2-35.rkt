#lang racket

;;;; Exercise 2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate
   +
   0
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (count-leaves sub-tree)
              1))
        tree)))

(define x (cons (list 1 2) (list 3 4)))

(= (count-leaves x) 4)
(= (count-leaves (list x x)) 8)