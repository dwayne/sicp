;;;; Exercise 1.8

;; computing cube roots

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

;; if y is an approximation for the cube root of x
;; then (improve y x) is a better approximation
(define (improve y x)
  ; x/y^2 + 2y
  ; ----------
  ;     3
  (/ (+ (/ x (square y))
        (* 2 y))
     3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (my-cbrt x)
  (cbrt-iter 1.0 x))

(my-cbrt 8)
(my-cbrt 27)
(my-cbrt 64)
(my-cbrt 125)
(my-cbrt 1000)