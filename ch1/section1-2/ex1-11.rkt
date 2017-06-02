#lang sicp

;;;; Exercise 1.11

; f(n) = n                          if n < 3
;      = f(n-1) + 2f(n-2) + 3f(n-3) if n ≥ 3

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(= (f-rec 0) 0)
(= (f-rec 1) 1)
(= (f-rec 2) 2)
(= (f-rec 3) 4)
(= (f-rec 4) 11)
(= (f-rec 5) 25)

(define (f-iter n)
  (define (f-iter-helper a b c n)
    (cond ((= n 2) c)
          ((< n 2) n)
          (else (f-iter-helper b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
  (f-iter-helper 0 1 2 n))

(= (f-iter 0) 0)
(= (f-iter 1) 1)
(= (f-iter 2) 2)
(= (f-iter 3) 4)
(= (f-iter 4) 11)
(= (f-iter 5) 25)
