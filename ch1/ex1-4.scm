;;;; Exercise 1.4

;; computes a + |b|
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; if b > 0 then
;;   (+ a b)
;; else
;;   (- a b)