#lang racket

;;;; Exercise 2.62

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((x1 (car set1)) (x2 (car set2)))
           (cond ((= x1 x2)
                  (cons x1 (union-set (cdr set1) (cdr set2))))
                 ((< x1 x2)
                  (cons x1 (union-set (cdr set1) set2)))
                 ((< x2 x1)
                  (cons x2 (union-set set1 (cdr set2)))))))))

(union-set '() '())
(union-set '(1) '())
(union-set '() '(1))
(union-set '(1 3 5 9 11) '(1 2 5 8 12))