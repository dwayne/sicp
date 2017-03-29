;;;; Exercise 1.7
;;;;
;;;; $ csi -s ex1-7.scm

(define (old-sqrt x)
  (old-sqrt-iter 1.0 x))

(define (old-sqrt-iter guess x)
  (if (old-good-enough? guess x)
      guess
      (old-sqrt-iter (improve guess x)
                 x)))

(define (old-good-enough? guess x)
  (< (abs (- (square guess) x)) tolerance))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define tolerance 0.001)

;; Is old-good-enough? effective for finding the square roots of very small
;; numbers?

(print "Is old-good-enough? effective on very small numbers?")
(print (old-sqrt 0.01))
(print (old-sqrt 0.0001))
(print (old-sqrt 0.000001))
(print (old-sqrt 0.00000001))
(print (old-sqrt 0.0000000001))

;; Expected    Actual
;; 0.1         0.100325785109606
;; 0.01        0.0323084483304812
;; 0.001       0.0312606555254453
;; 0.0001      0.0312501065624275
;; 0.00001     0.031250001065625

;; Is old-good-enough? effective for finding the square roots of very large
;; numbers?

(print "Is old-good-enough? effective on very large numbers?")
(print (old-sqrt 1e10))
(print (old-sqrt 1e20))
(print (old-sqrt 1e30))
(print (old-sqrt 1e40))
;; (print (old-sqrt 1e50))

;; Expected    Actual
;; 1e10        100000.0
;; 1e20        10000000000.0
;; 1e30        1e+15
;; 1e40        1e+20
;; 1e50        -
;;
;; N.B. (old-sqrt 1e50) didn't terminate in a reasonable amount of time.

;; From the results it seems as though old-good-enough? is NOT effective for
;; finding the square roots of very small or very large numbers.

;; Suggestion to improve old-good-enough?
;;
;; Watch how guess changes from one iteration to the next and stop when the
;; change is a very small fraction of the guess.

(define (new-sqrt x)
  (new-sqrt-iter x 1.0 x))

(define (new-sqrt-iter prev-guess next-guess x)
  (if (new-good-enough? prev-guess next-guess)
      next-guess
      (new-sqrt-iter next-guess (improve next-guess x) x)))

(define (new-good-enough? prev-guess next-guess)
  (< (/ (abs (- next-guess prev-guess))
        prev-guess)
     tolerance))

;; Is new-good-enough? effective for finding the square roots of very small
;; numbers?

(print "Is new-good-enough? effective on very small numbers?")
(print (new-sqrt 0.01))
(print (new-sqrt 0.0001))
(print (new-sqrt 0.000001))
(print (new-sqrt 0.00000001))
(print (new-sqrt 0.0000000001))

;; Expected    Actual
;; 0.1         0.100000000001399
;; 0.01        0.0100000000254907
;; 0.001       0.00100000015330166
;; 0.0001      0.000100000000000825
;; 0.00001     1.00000000156032e-05

;; Is new-good-enough? effective for finding the square roots of very large
;; numbers?

(print "Is new-good-enough? effective on very large numbers?")
(print (new-sqrt 1e10))
(print (new-sqrt 1e20))
(print (new-sqrt 1e30))
(print (new-sqrt 1e40))
(print (new-sqrt 1e50))

;; Expected    Actual
;; 1e10        100000.000156032
;; 1e20        10000000000.0231
;; 1e30        1.00000003002452e+15
;; 1e40        1.00000000011131e+20
;; 1e50        1.00000038075751e+25

;; From the results it seems as though new-good-enough? is a lot more effective
;; for finding the square roots of very small and very large numbers.

;; TODO: It would be nice to investigate why new-good-enough? is more effective
;; than old-good-enough?. However, this is a matter of numerical analysis and
;; out of scope in terms of what I want to learn from this book.
