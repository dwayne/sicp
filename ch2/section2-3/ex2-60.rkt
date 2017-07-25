#lang racket

;;;; Exercise 2.60

;; Θ(n), same as non-duplicate representation
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; Θ(1), better than non-duplicate representation which was Θ(n)
(define (adjoin-set x set)
  (cons x set))

;; Θ(n^2), same as non-duplicate representation
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; Θ(n), better than non-duplicate representation which was Θ(n^2)
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (cons (car set1)
               (union-set (cdr set1) set2)))))

;; This representation is better suited for:
;; 1. Adjoining elements to a set and
;; 2. Taking the union of two sets.