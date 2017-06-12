#lang sicp

;;;; Exercise 2.39

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-1 sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(reverse-1 nil)
(reverse-1 (list 1))
(reverse-1 (list 1 2))
(reverse-1 (list 1 2 3 4 5))

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(reverse-2 nil)
(reverse-2 (list 1))
(reverse-2 (list 1 2))
(reverse-2 (list 1 2 3 4 5))