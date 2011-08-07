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

;; a function to calculate the maximum depth to
;; count change for a given amount of money
(define (max-depth-count-change amount)
  (max-depth-cc amount 5))

(define (max-depth-cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 1)
        (else (+ 1
                 (max (max-depth-cc amount
                                    (- kinds-of-coins 1))
                      (max-depth-cc (- amount
                                       (first-denomination kinds-of-coins))
                                    kinds-of-coins))))))

(display "space:")
(newline)
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

;; the space used by count-change grows linearly, Θ(amount)

;; a function to calculate the number of leaves in the tree
;; used to count change for a given amount of money
(define (num-leaves-count-change amount)
  (num-leaves-cc amount 5))

(define (num-leaves-cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 1)
        (else (+ (num-leaves-cc amount
                                (- kinds-of-coins 1))
                 (num-leaves-cc (- amount
                                   (first-denomination kinds-of-coins))
                                kinds-of-coins)))))

(display "steps:")
(newline)
(num-leaves-count-change 1)
(num-leaves-count-change 2)
(num-leaves-count-change 3)
(num-leaves-count-change 4)
(num-leaves-count-change 5)
(num-leaves-count-change 6)
(num-leaves-count-change 7)
(num-leaves-count-change 8)
(num-leaves-count-change 9)
(num-leaves-count-change 10)
(num-leaves-count-change 20)
(num-leaves-count-change 30)
(num-leaves-count-change 40)
(num-leaves-count-change 50)
;;(num-leaves-count-change 100)
;;(num-leaves-count-change 200)
;;(num-leaves-count-change 300)
;;(num-leaves-count-change 400)
;;(num-leaves-count-change 500)
;;(num-leaves-count-change 1000)
(display "change in steps:")
(newline)
(define (change n)
  (* 1.0
     (/ (num-leaves-count-change (+ n 1))
        (num-leaves-count-change n))))
;(change 50)
;(change 60)
;(change 70)
;(change 80)
;(change 90)
;(change 100)
;(change 200)
;(change 300)
;(change 400)
;(change 500)
;(change 600)
;(change 700)
;(change 1000)