; by tlehman
; 
; Exercise 1.1: What is the result printed by the interpreter 
10
; => 12

(+ 5 3 4)
; => 12

(- 9 1)
; => 8

(/ 6 2)
; => 3

(+ (* 2 4) (- 4 6))
; => 6

(define a 3)
; => a

(define b (+ a 1))
; => b

(+ a b (* a b))
; => 19

(if (and (> b a) (< b (* a b)))
    b
    a)
; => 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; => 16

(+ 2 (if (> b a) b a))
; => 6

(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))
; => 16

