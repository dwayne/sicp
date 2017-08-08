#lang racket

;;;; Euclid's Algorithm

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Tests

(= (gcd 206 40) 2)
