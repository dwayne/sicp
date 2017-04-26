;;;; Exercise 1.41
;;;;
;;;; $ csi -s ex1-41.scm

(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(print ((double inc) 1))
(print (((double (double double)) inc) 5))

;; (double double)
;; (lambda (x) (double (double x)))
;;
;; (double (double double))
;; (lambda (x) ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x)))
;;
;; ((double (double double)) inc)
;; ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) inc))
;; ((lambda (x) (double (double x))) (double (double inc)))
;; (double (double (double (double inc))))
;;
;; Now,
;;
;; (double inc) - adds 2
;; (double (double inc)) - adds 4
;; (double (double (double inc))) - adds 8
;; (double (double (double (double inc)))) - adds 16
;;
;; Hence,
;;
;; (((double (double double)) inc) 5)
;;
;; should return,
;;
;; 16 + 5 = 21
