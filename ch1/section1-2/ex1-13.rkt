#lang racket

;;;; Exercise 1.13

; R.T.P. that Fib(n) is the closest integer to φ^n / √5, where φ = (1 + √5)/2.
;
; See http://dwaynecrooks.wordpress.com/2010/11/07/sicp-a-proof-for-exercise-1-13/
; for the proof. I also did over the proof in my notebook for those who have
; access to it.
;
; TODO: There are aspects of the two proofs I did that I'd like to capture in
; a better version in PDF form with Latex.

; Here are some useful definitions. Helpful for getting a feel for the value
; each function gives for various n.

(define (Fib n)
  (define (iter a b n)
    (cond ((= n 0) 0)
          ((= n 1) b)
          (else (iter b (+ a b) (- n 1)))))
  (iter 0 1 n))

(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

; computes ϕ^n / √5
(define (g n) (/ (expt phi n) (sqrt 5)))

; computes ψ^n / √5
(define (h n) (/ (expt psi n) (sqrt 5)))
