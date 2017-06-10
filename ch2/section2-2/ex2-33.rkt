#lang sicp

;;;; Exercise 2.33

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(my-map (lambda (x) (* x x)) (list 1 2 3 4))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(my-append (list 1 2 3) (list 4 5 6))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length nil)
(length (list 1))
(length (list 1 2))