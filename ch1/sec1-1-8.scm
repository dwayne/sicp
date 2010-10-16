;;;; Section 1.1.8
;;;; Procedures as Black-Box Abstractions

(define (my-sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

(my-sqrt 9)
(my-sqrt (+ 100 37))
(my-sqrt (+ (my-sqrt 2) (my-sqrt 3)))
(square (my-sqrt 1000))