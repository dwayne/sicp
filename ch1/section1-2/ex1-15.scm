;;;; Exercise 1.15
;;;;
;;;; $ csi -s ex1-15.scm

(define (cube x) (* x x x))

(define (p x) (- (* 3 x)
                 (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(print (sine 12.15))

;; a. The procedure p is applied 5 times when (sine 12.15)
;;    is evaluated. Reasoning: We need to find the smallest
;;    integer k such that 12.15 / 3^k ≤ 0.1 => 3^k ≥ 121.5
;;    => k ≥ 4.3 => k = 5.

;; b. The space and the number of steps required are both
;;    proportional to the number of times the procedure p
;;    is applied. p is applied log_3 10a times.
;;
;;      log_3 10a  = log_3 10 + log_3 a
;;                 = C + log_3 a
;;                 = Θ(log a)
;;
;;    Hence, space: Θ(log a) and steps: Θ(log a).
