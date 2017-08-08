#lang racket

(#%require sicp-pict)

;;;; Exercise 2.49

(define one 0.99) ; used to ensure that all lines and points are displayed

;; a. The painter that draws the outline of the designated frame

(define outline->painter
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect one 0))
         (make-segment (make-vect 0 0) (make-vect 0 one))
         (make-segment (make-vect 0 one) (make-vect one one))
         (make-segment (make-vect one 0) (make-vect one one)))))

(paint outline->painter)

;; b. The painter that draws an "X" by connecting opposite corners of the frame

(define x->painter
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect one one))
         (make-segment (make-vect 0 one) (make-vect one 0)))))

(paint x->painter)

;; c. The painter that draws a diamond shape by connecting the midpoints of the
;;    sides of the frame

(define diamond->painter
  (segments->painter
   (list (make-segment (make-vect 0 0.5) (make-vect 0.5 one))
         (make-segment (make-vect 0.5 one) (make-vect one 0.5))
         (make-segment (make-vect one 0.5) (make-vect 0.5 0))
         (make-segment (make-vect 0.5 0) (make-vect 0 0.5)))))

(paint diamond->painter)

;; d. The wave painter

(define wave->painter
  (segments->painter
   ; I took these values from https://tinyurl.com/6ppr7qx
   (list
    (make-segment
     (make-vect 0.006 0.840)
     (make-vect 0.155 0.591))
    (make-segment
     (make-vect 0.006 0.635)
     (make-vect 0.155 0.392))
    (make-segment
     (make-vect 0.304 0.646)
     (make-vect 0.155 0.591))
    (make-segment
     (make-vect 0.298 0.591)
     (make-vect 0.155 0.392))
    (make-segment
     (make-vect 0.304 0.646)
     (make-vect 0.403 0.646))
    (make-segment
     (make-vect 0.298 0.591)
     (make-vect 0.354 0.492))
    (make-segment
     (make-vect 0.403 0.646)
     (make-vect 0.348 0.845))
    (make-segment
     (make-vect 0.354 0.492)
     (make-vect 0.249 0.000))
    (make-segment
     (make-vect 0.403 0.000)
     (make-vect 0.502 0.293))
    (make-segment
     (make-vect 0.502 0.293)
     (make-vect 0.602 0.000))
    (make-segment
     (make-vect 0.348 0.845)
     (make-vect 0.403 one))
    (make-segment
     (make-vect 0.602 one)
     (make-vect 0.652 0.845))
    (make-segment
     (make-vect 0.652 0.845)
     (make-vect 0.602 0.646))
    (make-segment
     (make-vect 0.602 0.646)
     (make-vect 0.751 0.646))
    (make-segment
     (make-vect 0.751 0.646)
     (make-vect one 0.343))
    (make-segment
     (make-vect 0.751 0.000)
     (make-vect 0.597 0.442))
    (make-segment
     (make-vect 0.597 0.442)
     (make-vect one 0.144)))))

(paint wave->painter)