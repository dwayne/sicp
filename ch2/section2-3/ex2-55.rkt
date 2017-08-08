#lang racket

;;;; Exercise 2.55

(car ''abracadabra)

; Explanation:
;
; (car ''abracadabra)
; = (car '(quote abracadabra))
; = (car (list 'quote 'abracadabra))
; = 'quote