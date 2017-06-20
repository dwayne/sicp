#lang sicp
(#%require sicp-pict)

;;;; Exercise 2.50

(define my-flip-horiz
  (transform-painter (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

; (paint einstein)
; (paint (flip-horiz einstein))
(paint (my-flip-horiz einstein))

(define my-rotate180
  (transform-painter (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

; (paint einstein)
; (paint (rotate180 einstein))
(paint (my-rotate180 einstein))

(define my-rotate270
  (transform-painter (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))

; (paint einstein)
; (paint (rotate270 einstein))
(paint (my-rotate270 einstein))