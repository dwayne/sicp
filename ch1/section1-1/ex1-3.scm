;;;; Exercise 1.3
;;;;
;;;; $ csi -s ex1-3.scm

;; Returns the sum of the squares of the two larger numbers
(define (sum-of-squares a b c)
  (if (> a b)
      (+ (sqr a) (sqr (max b c)))
      (+ (sqr b) (sqr (max a c)))))

(define (sqr a) (* a a))

;; Test cases
(print (= (sum-of-squares 1 2 3) 13))
(print (= (sum-of-squares 1 3 2) 13))
(print (= (sum-of-squares 2 1 3) 13))
(print (= (sum-of-squares 2 3 1) 13))
(print (= (sum-of-squares 3 1 2) 13))
(print (= (sum-of-squares 3 2 1) 13))
(print (= (sum-of-squares 2 2 3) 13))
(print (= (sum-of-squares 2 3 2) 13))
(print (= (sum-of-squares 3 2 2) 13))
(print (= (sum-of-squares 3 3 3) 18))
