#lang racket

;;;; Exercise 1.38

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

(define (e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= (remainder i 3) 2)
                      (* 2.0 (/ (+ i 1) 3))
                      1.0))
                k)))

(e 1)
(e 2)
(e 3)
(e 4)
(e 5)
(e 6)
(e 7)
(e 8)
(e 9)
(e 10)
(e 11)

;; e = 2.7182818...
