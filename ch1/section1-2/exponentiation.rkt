#lang sicp

;;;; Section 1.2.4
;;;; Exponentiation

;; Θ(n) steps and Θ(n) space
(define (my-expt-rec b n)
  (if (= n 0)
      1
      (* b (my-expt-rec b (- n 1)))))

;; Θ(n) steps and Θ(1) space
(define (my-expt-iter b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
                   (- counter 1)
                   (* b product))))
  (expt-iter b n 1))

;; Θ(log n) steps and space
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))