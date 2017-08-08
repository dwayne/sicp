#lang racket

;;;; Exercise 1.16

; Using 2^9 as an example:
;
; b     n    a
; 2     9    1
; 2     8    2
; 4     4    2
; 16    2    2
; 256   1    2
; 256   0    512

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (* b b) (/ n 2) a))
          (else (iter b (- n 1) (* b a)))))
  (iter b n 1))

(= (fast-expt 2 9) 512)
