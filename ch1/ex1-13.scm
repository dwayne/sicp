;;;; Exercise 1.13

; R.T.P. that Fib(n) is the closest integer to φ^n / √5,
; where φ = (1 + √5)/2.

; see http://dwaynecrooks.wordpress.com/2010/11/07/sicp-a-proof-for-exercise-1-13/
; for the proof

(define (Fib n)
  (define (iter a b n)
    (if (= n 1)
        b
        (iter b (+ a b) (- n 1))))
  (iter 0 1 n))

(define φ (/ (+ 1 (sqrt 5)) 2))
(define ψ (/ (- 1 (sqrt 5)) 2))

; computes φ^n / √5
(define (g n) (/ (expt φ n) (sqrt 5)))

; computes ψ^n / √5
(define (h n) (/ (expt ψ n) (sqrt 5)))