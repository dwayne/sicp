#lang racket

;;;; Exercise 2.58b

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;(define (make-sum a1 a2) (list a1 '+ a2))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

;(define (make-product m1 m2) (list m1 '* m2))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (split-by-op x op)
  (define (normalize x)
    (if (null? (cdr x))
        (car x)
        x))
  (define (iter x left)
    (cond ((null? x) '())
          ((null? (cdr x)) '())
          ((eq? (cadr x) op)
           (list (append left (list (car x))) (cddr x)))
          (else
           (iter (cddr x)
                 (append left (list (car x) (cadr x)))))))
  (if (pair? x)
      (map normalize (iter x '()))
      '()))

(define (sum? x)
  (pair? (split-by-op x '+)))

(define (addend s) (car (split-by-op s '+)))

(define (augend s) (cadr (split-by-op s '+)))

(define (product? x)
  (and (pair? x) (null? (split-by-op x '+))))

(define (multiplier p) (car (split-by-op p '*)))

(define (multiplicand p) (cadr (split-by-op p '*)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (multiplicand exp)
                        (deriv (multiplier exp) var))))
        (else
         (error "unknown expression type -- DERIV" exp))))

;; Examples

(deriv '(x + 3) 'x)

(deriv '(x * y) 'x)

(deriv '(x * y * (x + 3)) 'x)

(deriv '(x + 3 * (x + y + 2)) 'x)