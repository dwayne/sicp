#lang racket

;;;; Exercise 1.4

;; It computes a + |b|
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Why?
;;
;; if b > 0 then
;;   (+ a b)
;; else
;;   (- a b)

(= (a-plus-abs-b 1 2) 3)
(= (a-plus-abs-b 1 -2) 3)