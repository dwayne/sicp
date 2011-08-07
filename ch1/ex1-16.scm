;;;; Exercise 1.16

; How to compute 2^100 using an iterative algorithm?
;
; b     n    a
; 2     100  1
; 4     50   1
; 16    25   1
; 16    24   16
; 256   12   16
; 65536 6    16
; x     3    16
; x     2    x*16
; x*x   1    x*16
; x*x   0    (x*x)*(x*16)
;
; where x = 65536 * 65536

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* b a)))))
  (iter b n 1))

(define (square x) (* x x))