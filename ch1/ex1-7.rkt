#lang racket/base

;;;; Exercise 1.7

;;;; Reference: http://en.wikipedia.org/wiki/Approximation_error

;; absolute error
(define (ε v v-approx) (abs (- v v-approx)))

;; relative error
(define (η v v-approx) (/ (ε v v-approx) (abs v)))

;; percentage error
(define (δ v v-approx) (* (η v v-approx) 100))

(define tol (make-parameter 0.001))

(define (sqrt-1 x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) (tol)))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define (sqrt-2 x)
  (define (good-enough? guess-old guess-new)
    (< (/ (abs (- guess-old guess-new))
          guess-new)
       (tol)))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess-old guess-new)
    (if (good-enough? guess-old guess-new)
        guess-new
        (sqrt-iter guess-new (improve guess-new))))
  (sqrt-iter x 1.0))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

(define (test sqrt data within)
  (define (test-iter data)
    (if (null? data)
        'done
        (let ([v (caar data)]
              [v2 (cadar data)])
          (let ([v-approx (parameterize ([tol within])
                            (sqrt v2))])
            (printf "~a ~a ~a ~a~n" v2 v v-approx (δ v v-approx))
            (test-iter (cdr data))))))
  (printf "tol = ~a~n" within)
  (test-iter data))

(define data '((0.1 0.01)
               (0.01 0.0001)
               (0.001 0.000001)
               (0.0001 0.00000001)
               (0.00001 0.0000000001)
               (1e10 1e20)
               (1e15 1e30)
               (1e20 1e40)
               (1e21 1e42)
               (1e22 1e44)
               (1e23 1e46)
               (1e24 1e48)
               (1e25 1e50)))

;(test sqrt-1 data 1e-9)
;; for tol = 1e-9 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 216%
;;
;; for tol = 1e-9 and x = 1e+46, the value of (sqrt x)
;; could not be determined within a reasonable time limit

;(test sqrt-1 data 1e-6)
;; for tol = 1e-6 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 9666%
;;
;; for tol = 1e-6 and x = 1e+46, the value of (sqrt x)
;; could not be determined within a reasonable time limit

;(test sqrt-1 data 1e-3)
;; for tol = 1e-3 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 9666%
;;
;; for tol = 1e-3 and x = 1e+46, the value of (sqrt x)
;; could not be determined within a reasonable time limit

;(test sqrt-2 data 1e-9)
;; for tol = 1e-9 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 1.7e-14%
;;
;; for tol = 1e-9 and x = 1e+46, the percentage error
;; in the computed square root is ≈ 0.0%

;(test sqrt-2 data 1e-6)
;; for tol = 1e-6 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 1.7e-14%
;;
;; for tol = 1e-6 and x = 1e+46, the percentage error
;; in the computed square root is ≈ 0.0%

;(test sqrt-2 data 1e-3)
;; for tol = 1e-3 and x = 1e-10, the percentage error
;; in the computed square root is ≈ 1.6e-7%
;;
;; for tol = 1e-3 and x = 1e+46, the percentage error
;; in the computed square root is ≈ 6.3e-9%

;(test sqrt-2 '((1e-100 1e-200) (1e100 1e200)) 1e-3)
;; in fact with sqrt-2 we still get good percentage errors
;; for extremely small and large values even when the
;; tolerance is 1e-3

;; conclusion: the suggested change works much better for
;; small and large numbers