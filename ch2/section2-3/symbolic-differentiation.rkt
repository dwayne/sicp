#lang racket

;;;; Example: Symbolic Differentiation

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;(define (make-sum a1 a2) (list '+ a1 a2))
;(define (make-sum a1 a2)
;  (cond ((=number? a1 0) a2)
;        ((=number? a2 0) a1)
;        ((and (number? a1) (number? a2)) (+ a1 a2))
;        (else (list '+ a1 a2))))

;(define (make-product m1 m2) (list '* m1 m2))
;(define (make-product m1 m2)
;  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
;        ((=number? m1 1) m2)
;        ((=number? m2 1) m1)
;        ((and (number? m1) (number? m2)) (* m1 m2))
;        (else (list '* m1 m2))))

;; Ex 2.57
(define (make-sum a b . rest)
  (define (add xs) (foldl + 0 xs))
  (let ((nums-and-terms (separate-nums-and-terms (cons a (cons b rest)))))
    (let ((sum (add (car nums-and-terms)))
          (terms (cdr nums-and-terms)))
      (cond ((null? terms) sum)
            ((=number? sum 0)
             (if (null? (cdr terms))
                 (car terms)
                 (cons '+ terms)))
            (else (cons '+ (cons sum terms)))))))

(define (make-product a b . rest)
  (define (mul xs) (foldl * 1 xs))
  (let ((nums-and-terms (separate-nums-and-terms (cons a (cons b rest)))))
    (let ((product (mul (car nums-and-terms)))
          (terms (cdr nums-and-terms)))
      (cond ((null? terms) product)
            ((=number? product 0) 0)
            ((=number? product 1)
             (if (null? (cdr terms))
                 (car terms)
                 (cons '* terms)))
            (else (cons '* (cons product terms)))))))

(define (separate-nums-and-terms xs)
  (define (iter xs nums terms)
    (if (null? xs)
        (cons nums terms)
        (let ((x (car xs)))
          (if (number? x)
              (iter (cdr xs) (cons x nums) terms)
              (iter (cdr xs) nums (cons x terms))))))
  (iter xs '() '()))
;; End of Ex 2.57

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

;(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

;(define (multiplicand p) (caddr p))

;; Ex 2.57
(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))
;; End of Ex 2.57

;; Ex 2.56

;(define (make-exponentiation b p) (list '** b p))
(define (make-exponentiation b p)
  (cond ((=number? p 0) 1)
        ((=number? p 1) b)
        ((and (number? b) (number? p)) (expt b p))
        (else (list '** b p))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

;; End of Ex 2.56

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
        ;; Ex 2.56
        ((exponentiation? exp)
         ; before Ex 2.57
         ;(make-product (exponent exp)
         ;              (make-product (make-exponentiation (base exp)
         ;                                                 (- (exponent exp) 1))
         ;                            (deriv (base exp) var))))
         ; after Ex 2.57
         (make-product (exponent exp)
                       (make-exponentiation (base exp)
                                            (- (exponent exp) 1))
                       (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

;; Examples

(deriv '(+ x 3) 'x)

(deriv '(* x y) 'x)

;(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(* x y (+ x 3)) 'x)

(deriv '(** x 2) 'x)

(deriv '(* 5 (** x 1)) 'x)