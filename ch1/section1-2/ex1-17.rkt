#lang sicp

;;;; Exercise 1.17

;;;; We assume a is an integer and b is a non-negative integer.

(define (slow-mult a b)
  (if (= b 0)
      0
      (+ a (slow-mult a (- b 1)))))

; slow-mult generates a linear recursive process
;
; (slow-mult 5 4)
; (+ 5 (slow-mult 5 3))
; (+ 5 (+ 5 (slow-mult 5 2)))
; (+ 5 (+ 5 (+ 5 (slow-mult 5 1))))
; (+ 5 (+ 5 (+ 5 (+ 5 (slow-mult 5 0)))))
; (+ 5 (+ 5 (+ 5 (+ 5 0))))
; (+ 5 (+ 5 (+ 5 5)))
; (+ 5 (+ 5 10))
; (+ 5 15)
; 20

(= (slow-mult 5 0) 0)
(= (slow-mult 5 1) 5)
(= (slow-mult 5 2) 10)
(= (slow-mult 5 3) 15)
(= (slow-mult 5 4) 20)
(= (slow-mult -5 0) 0)
(= (slow-mult -5 1) -5)
(= (slow-mult -5 2) -10)
(= (slow-mult -5 3) -15)
(= (slow-mult -5 4) -20)

(define (fast-mult a b)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))

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
