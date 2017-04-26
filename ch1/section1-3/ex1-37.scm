;;;; Exercise 1.37
;;;;
;;;; $ csi -s ex1-37.scm

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

(print (inverse-golden-ratio 1))
(print (inverse-golden-ratio 2))
(print (inverse-golden-ratio 3))
(print (inverse-golden-ratio 4))
(print (inverse-golden-ratio 5))
(print (inverse-golden-ratio 6))
(print (inverse-golden-ratio 7))
(print (inverse-golden-ratio 8))
(print (inverse-golden-ratio 9))
(print (inverse-golden-ratio 10))
(print (inverse-golden-ratio 11))

;; k must be at least 11 to get an approximation to 4 decimal places
;; 0.6180...
