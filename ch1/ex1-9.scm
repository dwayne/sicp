;;;; Exercise 1.9

(define (add a b)
  (if (= a 0)
      b
      (inc (add (dec a) b))))

; (add 4 5)
; (inc (add 3 5))
; (inc (inc (add 2 5)))
; (inc (inc (inc (add 1 5))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
;
; clearly a linear recursive process

(define (add a b)
  (if (= a 0)
      b
      (add (dec a) (inc b))))

; (add 4 5)
; (add 3 6)
; (add 2 7)
; (add 1 8)
; (add 0 9)
; 9
;
; clearly a linear iterative process

;; definition of helpers inc and dec
(define (inc n) (+ n 1))
(define (dec n) (- n 1))