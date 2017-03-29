;;;; Exercise 1.5

(define (p) (p)) ;; infinite loop

(define (test x y)
  (if (= x 0)
      0
      y))

;; (test 0 (p))

;; For applicative-order evaluation we get an infinite loop
;; since the procedure p will be evaluated.
;;
;; For normal-order evaluation the value 0 is returned. Notice
;; that x evaluates to 0 and so (= x 0) is true. Therefore, the
;; then branch is taken and the value 0 is returned. Since the
;; value of y is never needed, y is never evaluated thereby
;; avoiding an infinite loop.
