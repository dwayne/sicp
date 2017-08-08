#lang racket

;;;; Exercise 2.41

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append '() (map proc sequence)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-pairs 1)
(unique-pairs 2)
(unique-pairs 3)

(define (unique-triples n)
  (flatmap (lambda (i)
            (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-triples 1)
(unique-triples 2)
(unique-triples 3)
(unique-triples 4)
(unique-triples 5)

(define (sum-triples n s)
  (filter (lambda (triple)
            (= (+ (car triple)
                  (cadr triple)
                  (caddr triple))
               s))
          (unique-triples n)))

(sum-triples 5 8)
(sum-triples 5 9)
(sum-triples 5 10)