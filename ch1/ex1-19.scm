;;;; Exercise 1.19

; a <- bq + aq + ap
; b <- bp + aq

; After 1st transformation
; a <- bq + aq + ap + bp + aq
; b <- bq + aq + ap

; After 2nd transformation
; a <- 2(bq + aq + ap) + bp + aq
;   <- 2bq + 2aq + ap + ap + bp + aq
;   <- 2q(a + b) + p(a + b) + a(p + q)
;   <- b(p + 2q) + a(p + 2q) + a(p + q)
;   <- bq' + aq' + ap'
; b <- b(p + q) + a(p + 2q)
;   <- bp' + aq'
;
; where, p' = p + q and q' = p + 2q

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ p q)
                   (+ p q q)
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(= (fib 0) 0)
(= (fib 1) 1)
(= (fib 2) (+ (fib 0) (fib 1))) ; why is this not true?
(= (fib 3) (+ (fib 1) (fib 2)))
(= (fib 4) (+ (fib 2) (fib 3)))
(= (fib 5) (+ (fib 3) (fib 4)))

(list (fib 0)
      (fib 1)
      (fib 2)
      (fib 3)
      (fib 4)
      (fib 5)
      (fib 6)
      (fib 7)
      (fib 8)
      (fib 9)
      (fib 10))