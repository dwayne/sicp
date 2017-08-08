#lang racket

;;;; Exercise 2.19

(define us-coins (list 50 25 10 5 1))

(define reverse-us-coins (list 1 5 10 25 50))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? values) (null? values))

(define (first-denomination values) (car values))

(define (except-first-denomination values) (cdr values))

(cc 100 us-coins)

(cc 100 reverse-us-coins)

;; The order of the list coin-values doesn't affect the answer produced by cc.
;;
;; Reason: The logic just considers whether or not a coin value is used and not
;; when it is used. The else clause doesn't depend on the order of coin-values.