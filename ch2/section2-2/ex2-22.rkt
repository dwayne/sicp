#lang sicp

;;;; Exercise 2.22

(define (square x) (* x x))

(define (square-list-reverse items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; The above produces the answer list in reverse order since
;; the things and answer lists evolve in the following way. Let
;; items = (list 1 2 3 4) then initially things = (list 1 2 3 4)
;; and answer = nil.
;;
;; Step 1: things = (list 2 3 4), answer = (list 1)
;; Step 2: things = (list 3 4), answer = (list 4 1)
;; Step 3: things = (list 4), answer = (list 9 4 1)
;; Step 4: things = nil, answer = (list 16 9 4 1)

(define (square-list-wierd items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; This also doesn't work because the following happens when
;; items = (list 1 2 3 4).
;;
;; Step 0: things = (list 1 2 3 4), answer = nil
;; Step 1: things = (list 2 3 4), answer = (cons nil 1)
;; Step 2: things = (list 3 4), answer = (cons (cons nil 1) 4)
;; Step 3: things = (list 4), answer = (cons (cons (cons nil 1) 4) 9)
;; Step 4: things = nil, answer = (cons (cons (cons (cons nil 1) 4) 9) 16)

(square-list-reverse (list 1 2 3 4))
(square-list-wierd (list 1 2 3 4))