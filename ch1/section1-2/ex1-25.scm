;;;; Exercise 1.25

; No! She's not correct.
;
; (define (expmod base exp m)
;   (remainder (fast-expt base exp) m))
;
; fast-expt takes logarithmic time but then we to consider the time it would
; take to compute the remainder of a really large number. The total time is
; thus the time it takes to compute the exponentiation plus the time it takes
; to compute the remainder. Based on my research it's not logarithmic.
