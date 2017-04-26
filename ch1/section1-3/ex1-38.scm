;;;; Exercise 1.38
;;;;
;;;; $ csi -s ex1-38.scm

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
	result
	(iter (- i 1)
	      (/ (n i)
		 (+ (d i) result)))))
  (iter k 0))

(define (e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
		(lambda (i)
		  (if (= (remainder i 3) 2)
		      (* 2.0 (/ (+ i 1) 3))
		      1.0))
		k)))

(print (e 1))
(print (e 2))
(print (e 3))
(print (e 4))
(print (e 5))
(print (e 6))
(print (e 7))
(print (e 8))
(print (e 9))
(print (e 10))
(print (e 11))

;; e = 2.7182818...
