;;;; Exercise 1.3

;; returns the sum of the squares of the two larger numbers
(define (sum-of-squares a b c)
  (- (+ (sqr a) (sqr b) (sqr c))
     (sqr (min3 a b c))))

(define (sqr a) (* a a))
(define (min3 a b c) (min a (min b c)))

;; some simple test cases
(= (sum-of-squares 1 2 3) 13)
(= (sum-of-squares 1 3 2) 13)
(= (sum-of-squares 2 1 3) 13)
(= (sum-of-squares 2 3 1) 13)
(= (sum-of-squares 3 1 2) 13)
(= (sum-of-squares 3 2 1) 13)
(= (sum-of-squares 2 2 3) 13)
(= (sum-of-squares 2 3 2) 13)
(= (sum-of-squares 3 2 2) 13)
(= (sum-of-squares 3 3 3) 18)