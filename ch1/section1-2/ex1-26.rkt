#lang sicp

;;;; Exercise 1.26

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
                       ; computed twice
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; Let T(exp) represent the number of steps to compute expmod. Then,
;
; T(0)   = 1
; T(exp) = 2 * T(exp/2)
;
; Therefore, T(exp) is Θ(exp).
