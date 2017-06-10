#lang sicp

;;;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define m
  (make-mobile
   (make-branch 10 3)
   (make-branch 5 (make-mobile
                   (make-branch 2 2)
                   (make-branch 1 4)))))

; a.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; b.

(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (+ (weight-of-structure (branch-structure left))
       (weight-of-structure (branch-structure right)))))

(define (weight-of-structure structure)
  (if (pair? structure)
      (total-weight structure)
      structure))

(= (total-weight m) 9)

; c.

(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch)
       (weight-of-structure (branch-structure branch))))
  (define (balanced-structure? structure)
    (if (pair? structure)
        (balanced? structure)
        true))
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (torque left) (torque right))
         (balanced-structure? (branch-structure left))
         (balanced-structure? (branch-structure right)))))

(balanced? m)

(define a (make-mobile (make-branch 1 10)
                       (make-branch 2 5)))
(balanced? a)

(define b (make-mobile (make-branch 3 a)
                       (make-branch 1 1)))
(not (balanced? b))

; d.

; If we change the representation of mobiles so that the constructors
; are:
;
; (define (make-mobile left right)
;   (cons left right))
;
; (define (make-branch length structure)
;   (cons length structure))
;
; Then, we'd only need to change the right-branch and the branch-structure
; selectors to convert to the new representation.