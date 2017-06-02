#lang sicp

;;;; Exercise 1.6

;; Why does if need to be provided as a special form?

;; Here's the new version of if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(= (new-if (= 2 3) 0 5) 5)
(= (new-if (= 1 1) 0 5) 0)

;; However, the following fails to compute the desired result
;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x)
;;                      x)))

;; Why?
;;
;; Consider,
;;
;; (sqrt-iter 1.0 2)
;;
;; To evaluate the combination we begin by retrieving the body of sqrt-iter and
;; then replacing the formal parameters guess and x by the arguments 1.0 and 2
;; respectively.
;;
;; (new-if (good-enough? 1.0 2) 1.0 (sqrt-iter (improve 1.0 2) 2))
;;
;; To evaluate the combination we must first evaluate its subexpressions. Doing
;; so we get,
;;
;; (new-if #f 1.0 (sqrt-iter 1.5 2))
;;
;; Notice that the 3rd argument still needs to be reduced before we can apply
;; the new-if procedure. After a few more evaluations we get,
;;
;; (new-if #f 1.0 (new-if #f 1.5 (new-if #f 1.4167 (sqrt-iter 1.4142 2))))
;;
;; It can be seen that this evaluation will never stop since all the arguments
;; to new-if are always evaluated before applying new-if. In particular, the
;; last argument to new-if which loops indefinitely always gets evaluated.
;;
;; Note: This happens because new-if is defined using an ordinary procedure and
;; the interpreter uses applicative order evaluation.
