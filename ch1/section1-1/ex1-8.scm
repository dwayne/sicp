;;;; Exercise 1.8
;;;;
;;;; $ csi -s ex1-8.scm

(define (cube-root x)
  (cube-root-iter x 1.0 x))

(define (cube-root-iter prev-guess next-guess x)
  (if (good-enough? prev-guess next-guess)
      next-guess
      (cube-root-iter next-guess (improve next-guess x) x)))

;; Based on the suggestion from Exercise 1.7
(define (good-enough? prev-guess next-guess)
  (< (/ (abs (- next-guess prev-guess))
        prev-guess)
     tolerance))

(define tolerance 0.0000001)

;; If y is an approximation to the cube root of x, then a better approximation
;; is given by the value
;;
;;   x/y^2 + 2y
;;  ------------
;;        3
(define (improve y x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(print (cube-root 8))    ; 2
(print (cube-root 27))   ; 3
(print (cube-root 64))   ; 4
(print (cube-root 125))  ; 5
(print (cube-root 1000)) ; 10

;; Try some very small numbers
(print (cube-root 0.001))             ; 0.1
(print (cube-root 0.000001))          ; 0.01
(print (cube-root 0.000000001))       ; 0.001
(print (cube-root 0.000000000001))    ; 0.0001
(print (cube-root 0.000000000000001)) ; 0.00001

;; Try some very large numbers
(print (cube-root 1e9))  ; 1000
(print (cube-root 1e27)) ; 1e9
(print (cube-root 1e30)) ; 1e10
(print (cube-root 1e60)) ; 1e20
(print (cube-root 1e90)) ; 1e30
