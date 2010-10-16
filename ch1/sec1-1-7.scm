;;;; Section 1.1.7
;;;; Example: Square Roots by Newton's Method

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(my-sqrt 9)
(my-sqrt (+ 100 37))
(my-sqrt (+ (my-sqrt 2) (my-sqrt 3)))
(square (my-sqrt 1000))