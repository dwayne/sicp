;;;; Exercise 1.17

(define (slow-mult a b) ; generates a linear recursive process
  (if (= b 0)
      0
      (+ a (slow-mult a (- b 1)))))

; (slow-mult 5 4)
; (+ 5 (slow-mult 5 3))
; (+ 5 (+ 5 (slow-mult 5 2)))
; (+ 5 (+ 5 (+ 5 (slow-mult 5 1))))
; (+ 5 (+ 5 (+ 5 (+ 5 (slow-mult 5 0)))))
; (+ 5 (+ 5 (+ 5 (+ 5 0))))
; (+ 5 (+ 5 (+ 5 5)))
; (+ 5 (+ 5 10))
; (+ 5 15)
; 20

(define (test-mult op a b)
  (= (op a b) (* a b)))

(test-mult slow-mult 5 0)
(test-mult slow-mult 5 1)
(test-mult slow-mult 5 2)
(test-mult slow-mult 5 3)
(test-mult slow-mult 5 4)
(test-mult slow-mult -5 0)
(test-mult slow-mult -5 1)
(test-mult slow-mult -5 2)
(test-mult slow-mult -5 3)
(test-mult slow-mult -5 4)

; fails, need b >= 0
;(test-mult slow-mult 5 -1)

(define (double x) (+ x x))
(define (halve x) (/ x 2)) ; assumes x is even

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(test-mult fast-mult 5 0)
(test-mult fast-mult 5 1)
(test-mult fast-mult 5 2)
(test-mult fast-mult 5 3)
(test-mult fast-mult 5 4)
(test-mult fast-mult -5 0)
(test-mult fast-mult -5 1)
(test-mult fast-mult -5 2)
(test-mult fast-mult -5 3)
(test-mult fast-mult -5 4)