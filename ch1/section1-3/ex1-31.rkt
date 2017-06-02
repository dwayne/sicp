#lang sicp

;;;; Exercise 1.31

; a.

(define (product-rec factor a next b)
  (if (> a b)
      1
      (* (factor a)
         (product-rec factor (next a) next b))))

; b.

(define (product-iter factor a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (factor a)))))
  (iter a 1))

; Compute an approximation to pi using
;
;  pi    2 * 4 * 4 * 6 * 6 * 8 * ...
; ---- = ---------------------------
;  4     3 * 3 * 5 * 5 * 7 * 7 * ...

(define (pi product n)
  (define (inc i) (+ i 1))
  (define (top-factor i)
    (if (even? i) (+ i 2) (+ i 3)))
  (define (bottom-factor i)
    (if (even? i) (+ i 3) (+ i 2)))
  (* 4.0
     (/ (product top-factor 0 inc (- n 1))
        (product bottom-factor 0 inc (- n 1)))))

(pi product-rec 1000)
(pi product-iter 1000)
