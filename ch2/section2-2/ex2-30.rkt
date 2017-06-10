#lang sicp

;;;; Exercise 2.30

(define (square x) (* x x))

(define a (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

; Direct implementation
(define (square-tree-1 tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))

(square-tree-1 a)

; Using map and recursion
(define (square-tree-2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-2 sub-tree)
             (square sub-tree)))
       tree))

(square-tree-2 a)