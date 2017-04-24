;;;; Exercise 1.27
;;;;
;;;; $ csi -s ex1-27.scm

; Numbers that fool the Fermat test are called Carmichael numbers
(define (carmichael? n)
  (define (iter a)
    (cond ((= a n) #t)
          ((= (expmod a n n) a)
           (iter (+ a 1)))
          (else #f)))
  (iter 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(print (carmichael? 561))
(print (carmichael? 1105))
(print (carmichael? 1729))
(print (carmichael? 2465))
(print (carmichael? 2821))
(print (carmichael? 6601))
