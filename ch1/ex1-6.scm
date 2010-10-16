;;;; Exercise 1.6

;; Why does if need to be provided as a special form?

;; new version of if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(= (new-if (= 2 3) 0 5) 5)
(= (new-if (= 1 1) 0 5) 0)

;; however, the following fails to compute the desired result
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))

;; since new-if is defined as a procedure and the interpreter
;; uses applicative order evaluation, all three of its arguments
;; will be evaluated (whether or not the predicate evaluates to
;; true) before entering the body of the procedure
;; hence the recursion never stops