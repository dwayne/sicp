#lang sicp

;;;; Exercise 1.37

(define (cont-frac n d k)
  ;; a.
  (define (rec i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i)
              (rec (+ i 1))))))
  ;; b.
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  ;;(rec 1)
  (iter k 0))

;; Check cont-frac by approximating 1/φ

(define (inverse-golden-ratio k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(inverse-golden-ratio 1)
(inverse-golden-ratio 2)
(inverse-golden-ratio 3)
(inverse-golden-ratio 4)
(inverse-golden-ratio 5)
(inverse-golden-ratio 6)
(inverse-golden-ratio 7)
(inverse-golden-ratio 8)
(inverse-golden-ratio 9)
(inverse-golden-ratio 10)
(inverse-golden-ratio 11)

;; k must be at least 11 to get an approximation to 4 decimal places
;; 0.6180...
