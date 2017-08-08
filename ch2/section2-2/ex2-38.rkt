#lang racket

;;;; Exercise 2.38

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; (fold-right + 0 (list 1 2 3))
; = (+ 1 (fold-right + 0 (list 2 3)))
; = (+ 1 (+ 2 (fold-right + 0 (list 3))))
; = (+ 1 (+ 2 (+ 3 (fold-right + 0 nil))))
; = (+ 1 (+ 2 (+ 3 0)))
; = (+ 1 (+ 2 3))
; = (+ 1 5)
; = 6
;
; In general,
; (fold-right op initial (list a1 a2 ... an))
; = (op a1 (op a2 (... (op an initial)...)))
;
; Using infix notation,
; = a1 op (a2 op (... op (an op initial)...))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; (fold-left + 0 (list 1 2 3))
; = (iter 0 (list 1 2 3))
; = (iter (+ 0 1) (list 2 3))
; = (iter (+ (+ 0 1) 2) (list 3))
; = (iter (+ (+ (+ 0 1) 2) 3) nil)
; = (+ (+ (+ 0 1) 2) 3)
; = ...
; = 6
;
; In general,
; (fold-left op initial (list a1 a2 ... an))
; = (op (... (op (op initial a1) a2) ...) an)
;
; Using infix notation,
; = ((...((initial op a1) op a2) op ...) op an)

(= (fold-right / 1 (list 1 2 3))
   (/ 3 2))

(= (fold-left / 1 (list 1 2 3))
   (/ 1 6))

(equal? (fold-right list '() (list 1 2 3))
        (list 1 (list 2 (list 3 '()))))

(equal? (fold-left list '() (list 1 2 3))
        (list (list (list '() 1) 2) 3))

; op should be associative (and commutative with at least initial) to guarantee
; that fold-right and fold-left produce the same values for any sequence