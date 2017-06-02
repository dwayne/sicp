#lang sicp

;;;; Exercise 1.9

(define (add-rec a b)
  (if (= a 0)
      b
      (inc (add-rec (dec a) b))))

; (add-rec 4 5)
; (inc (add-rec 3 5))
; (inc (inc (add-rec 2 5)))
; (inc (inc (inc (add-rec 1 5))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
;
; clearly a linear recursive process

(define (add-iter a b)
  (if (= a 0)
      b
      (add-iter (dec a) (inc b))))

; (add-iter 4 5)
; (add-iter 3 6)
; (add-iter 2 7)
; (add-iter 1 8)
; (add-iter 0 9)
; 9
;
; clearly a linear iterative process

;; definition of helpers inc and dec
(define (inc n) (+ n 1))
(define (dec n) (- n 1))