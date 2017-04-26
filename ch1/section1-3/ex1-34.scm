;;;; Exercise 1.34

(define (f g)
  (g 2))

(define (square x) (* x x))

(print (f square))
; 4

(print (f (lambda (z) (* z (+ z 1)))))
; 6

; Uncomment the next line to see what happens
; (print (f f))
; => (f f)
; => (f 2)
; => (2 2)
; => error, since 2 is not a procedure
