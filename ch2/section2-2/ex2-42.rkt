#lang sicp

;;;; Exercise 2.42

(#%require racket/base) ; for filter

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

;; A solution to the "eight-queens puzzle"

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position row col positions)
  (cons (list row col) positions))

(define (safe? positions)
  (let ((position (car positions)))
    (all (lambda (position)
           (not (is-attacked? position (car positions))))
         (cdr positions))))

(define (all proc? sequence)
  (if (null? sequence)
      true
      (and (proc? (car sequence))
           (all proc? (cdr sequence)))))

(define (is-attacked? pos1 pos2)
  (let ((row1 (car pos1))
        (col1 (cadr pos1))
        (row2 (car pos2))
        (col2 (cadr pos2)))
    (or (= row1 row2)
        (= (abs (- row1 row2))
           (abs (- col1 col2))))))

(queens 1)
(queens 2)
(queens 3)
(queens 4)
(= (length (queens 10)) 724)