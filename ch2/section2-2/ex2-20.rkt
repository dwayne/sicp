#lang sicp

;;;; Exercise 2.20

(define (same-parity x . rest)
  (define (group-by pred? xs)
    (if (null? xs)
        nil
        (let ((x (car xs)))
          (cond ((pred? x)
                 (cons x (group-by pred? (cdr xs))))
                (else
                 (group-by pred? (cdr xs)))))))
  (cons x
        (if (even? x)
            (group-by even? rest)
            (group-by odd? rest))))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)