#lang sicp

;;;; Exercise 1.14

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(= (count-change 100) 292)

;; Calculates the maximum depth of the tree that's
;; needed to find the result for counting change
;; for a given amount of money
(define (max-depth-count-change amount)
  (max-depth amount 5))

(define (max-depth amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 1)
        (else (+ 1
                 (max (max-depth amount
                                 (- kinds-of-coins 1))
                      (max-depth (- amount
                                    (first-denomination kinds-of-coins))
                                 kinds-of-coins))))))

(max-depth-count-change 1)
(max-depth-count-change 2)
(max-depth-count-change 3)
(max-depth-count-change 4)
(max-depth-count-change 5)
(max-depth-count-change 6)
(max-depth-count-change 7)
(max-depth-count-change 8)
(max-depth-count-change 9)
(max-depth-count-change 10)
(max-depth-count-change 11)
(max-depth-count-change 12)
(max-depth-count-change 13)
(max-depth-count-change 14)
(max-depth-count-change 15)
(max-depth-count-change 16)
(max-depth-count-change 17)
(max-depth-count-change 18)
(max-depth-count-change 19)
(max-depth-count-change 20)
(max-depth-count-change 21)
(max-depth-count-change 22)
(max-depth-count-change 23)
(max-depth-count-change 24)
(max-depth-count-change 25)
(max-depth-count-change 50)
(max-depth-count-change 100)

;; (= (max-depth-count-change n) (+ n 5))
;; Hence, the space used by count-change grows linearly.
;; i.e. space: ϴ(n)

;; Calculates the total number of leaves of the tree that's
;; needed to find the result for counting change
;; for a given amount of money
(define (total-leaves-count-change amount)
  (total-leaves amount 5))

(define (total-leaves amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 1)
        (else (+ (total-leaves amount
                               (- kinds-of-coins 1))
                 (total-leaves (- amount
                                  (first-denomination kinds-of-coins))
                               kinds-of-coins)))))

(define (display-total-leaves max-amount)
  (define (display-total-leaves-iter amount prev-value)
    (cond ((<= amount max-amount)
           (let ((value (total-leaves-count-change amount)))
             (display amount)
             (display ": ")
             (display value)
             (display "; ")
             (display (- value prev-value))
             (display "; ")
             (display (/ value prev-value))
             (display "; ")
             (display (expt value 0.2)) ;; 0.2 = 1/5
             (newline)
             (display-total-leaves-iter (+ amount 1) value)))))
  (display-total-leaves-iter 1 1))

(display-total-leaves 500)

;; The output of print-total-leaves suggests that the time complexity is
;; exponential, ϴ(k^n), where 1 < k < 2.
;;
;; However, the following CS Stack Exchange answer suggests that the
;; time complexity is ϴ(n^5). See http://cs.stackexchange.com/a/68704/35513.
