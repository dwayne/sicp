#lang racket

;;;; Exercise 1.18

; Here's how to derive the logarithmic iterative process. We keep m + a*b
; unchanged. Using 5 * 5 as an example:
;
; a    b    m
; 5    5    0
; 5    4    5
; 10   2    5
; 20   1    5
; 20   0    25

(define (fast-mult a b)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (iter a b m)
    (cond ((= b 0) m)
          ((even? b) (iter (double a) (halve b) m))
          (else (iter a (- b 1) (+ a m)))))
  (iter a b 0))

(= (fast-mult 5 0) 0)
(= (fast-mult 5 1) 5)
(= (fast-mult 5 2) 10)
(= (fast-mult 5 3) 15)
(= (fast-mult 5 4) 20)
(= (fast-mult -5 0) 0)
(= (fast-mult -5 1) -5)
(= (fast-mult -5 2) -10)
(= (fast-mult -5 3) -15)
(= (fast-mult -5 4) -20)
