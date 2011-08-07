;;;; Exercise 1.18

; How to compute 5*100 using an iterative algorithm?
;
; a    b    c
; 5    100  0
; 10   50   0
; 20   25   0
; 20   24   20
; 40   12   20
; 80   6    20
; 160  3    20
; 160  2    180
; 320  1    180
; 320  0    500
;
; invariant: a*b + c = 5*100

(define (double x) (+ x x))
(define (halve x) (/ x 2)) ; assumes x is even

(define (mult a b)
  (define (iter a b c)
    (cond ((= b 0) c)
          ((even? b) (iter (double a) (halve b) c))
          (else (iter a (- b 1) (+ a c)))))
  (iter a b 0))

(define (test-mult op a b)
  (= (op a b) (* a b)))

(test-mult mult 5 0)
(test-mult mult 5 1)
(test-mult mult 5 2)
(test-mult mult 5 3)
(test-mult mult 5 4)
(test-mult mult -5 0)
(test-mult mult -5 1)
(test-mult mult -5 2)
(test-mult mult -5 3)
(test-mult mult -5 4)
(test-mult mult 8 100)
(test-mult mult 25 1000000)
(test-mult mult 25431 1403201)