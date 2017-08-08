#lang racket

;;;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (t) (cons (car s) t)) rest)))))

(subsets '())
(subsets (list 1))
(subsets (list 1 2))
(subsets (list 1 2 3))

; Why it works?
;
; The empty set is a subset of every set. Hence, if s is the empty set
; that's why we return the list containing the empty set.
;
; Otherwise, the set s is non-empty. Now, the subsets of s can be partitioned
; into the subsets that contain (car s) and those that don't, namely
; (subsets (cdr s)). To get the ones that do contain (car s) we simply
; add (car s) to all the subsets that don't.