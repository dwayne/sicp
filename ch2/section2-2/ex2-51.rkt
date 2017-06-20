#lang sicp
(#%require sicp-pict)

;;;; Exercise 2.51

; Way 1
(define (my-below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-bottom
           (transform-painter (make-vect 0 0)
                              (make-vect 1 0)
                              split-point))
          (paint-top
           (transform-painter split-point
                              (make-vect 1 0.5)
                              (make-vect 0 1))))
      (lambda (frame)
        ((paint-bottom painter1) frame)
        ((paint-top painter2) frame)))))

(paint (below einstein diagonal-shading))
(paint (my-below einstein diagonal-shading))

; Way 2
(define (my-below-alt painting1 painting2)
  (rotate270 (beside painting2
                     (rotate270 (rotate270 (rotate270 painting1))))))

(paint (my-below-alt einstein diagonal-shading))