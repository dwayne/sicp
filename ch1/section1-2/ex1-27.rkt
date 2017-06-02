#lang sicp

;;;; Exercise 1.27

; Numbers that fool the Fermat test are called Carmichael numbers
(define (carmichael? n)
  (define (iter a)
    (cond ((= a n) #t)
          ((= (expmod a n n) a)
           (iter (+ a 1)))
          (else #f)))
  (iter 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
