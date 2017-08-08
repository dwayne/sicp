#lang racket

;;;; Exercise 2.37

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op initial sequences)
  (if (null? (car sequences))
      '()
      (cons (accumulate op initial (map car sequences))
            (accumulate-n op initial (map cdr sequences)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(= (dot-product (list 1 2 3) (list 1 2 3))
   14)

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(equal? (matrix-*-vector (list (list 1 2)
                               (list 3 4))
                         (list 2 3))
        (list 8 18))

(define (transpose m)
  (accumulate-n cons '() m))

(equal? (transpose (list (list 1 2 3 4)
                         (list 5 6 7 8)))
        (list (list 1 5)
              (list 2 6)
              (list 3 7)
              (list 4 8)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col) (dot-product row col)) cols))
         m)))

(equal? (matrix-*-matrix (list (list 1 2 3)
                               (list 3 2 1))
                         (list (list 1 3)
                               (list 2 2)
                               (list 3 1)))
        (list (list 14 10)
              (list 10 14)))