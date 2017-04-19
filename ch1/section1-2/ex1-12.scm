;;;; Exercise 1.12
;;;;
;;;; $ csi -s ex1-12.scm

; Pascal's Triangle
; -----------------
;
; C       r
;     0 1 2 3 4 ...
;   0 1
;   1 1 1
; n 2 1 2 1
;   3 1 3 3 1
;   4 1 4 6 4 1
;   .
;   .
;   .

(define (C n r)
  (cond ((or (< n 0) (< r 0) (< n r)) 0)
        ((or (= r 0) (= n r)) 1)
        (else (+ (C (- n 1) r)
                 (C (- n 1) (- r 1))))))

(print (= (C 0 0) 1))
(print (= (C 1 0) 1))
(print (= (C 1 1) 1))
(print (= (C 2 0) 1))
(print (= (C 2 1) 2))
(print (= (C 2 2) 1))
(print (= (C 3 0) 1))
(print (= (C 3 1) 3))
(print (= (C 3 2) 3))
(print (= (C 3 3) 1))
(print (= (C 4 0) 1))
(print (= (C 4 1) 4))
(print (= (C 4 2) 6))
(print (= (C 4 3) 4))
(print (= (C 4 4) 1))
