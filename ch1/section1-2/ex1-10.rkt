#lang racket

;;;; Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; ...
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; ...
; (A 0 512)
; 1024
(= (A 1 10) 1024)


; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 4))
; (A 1 16)
; 65536
(= (A 2 4) 65536)

; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 4)
; 65536
(= (A 3 3) 65536)

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))

; Theorem 1: (f n) ≡ 2n ∀n ≥ 1.
;
; Proof:
;
; Let n ≥ 1, then
;
;     (f n) = (A 0 n)
;           = (* 2 n)
;           = 2n
;
; [Q.E.D.]

; Theorem 2: (g n) ≡ 2^n ∀n ≥ 1.
;
; Proof: (by Induction on n)
; When n = 1, L.H.S. = (g 1) = (A 1 1) = 2 = 2^1 = R.H.S.
;
; Assume the result holds for some k ≥ 1. Then,
;     (g (+ k 1)) = (A 1 (+ k 1))
;                 = (A 0 (A 1 k)), since (+ k 1) ≥ 2
;                 = (A 0 2^k), by I.H.
;                 = 2(2^k), by Theorem 1
;                 = 2^(k+1)
;
; The result follows by P.M.I. [Q.E.D.]

; Let (^ 2 n) represent 2^2^...^2 (n-1 exponentiations).
; For example:
; (^ 2 1) = 2
; (^ 2 2) = 2^2 = 4
; (^ 2 3) = 2^2^2 = 2^4 = 16
; (^ 2 4) = 2^2^2^2 = 2^16 = 65536

; Theorem 3: (h n) ≡ (^ 2 n) ∀n ≥ 1.
;
; Proof: (by Induction on n)
; When n = 1, L.H.S. = (h 1) = (A 2 1) = 2 = (^ 2 1) = R.H.S.
;
; Assume the result holds for some k ≥ 1. Then,
;     (h (+ k 1)) = (A 2 (+ k 1))
;                 = (A 1 (A 2 k)), since (+ k 1) ≥ 2
;                 = (A 1 (^ 2 k)), by I.H.
;                 = 2^(^ 2 k), by Theorem 2
;                 = (^ 2 (+ k 1))
;
; The result follows by P.M.I. [Q.E.D.]
