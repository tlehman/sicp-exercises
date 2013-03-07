; Exercise 1.31(a): The sum procedure is only the simplest of a vast number of procedures. Write an analogous procedure called product that returns the product of the values of a function at points over a given range.
(define (product f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (f a) result))))
  (iter a 1))

(load "ex-1.30.scm")   ; to get the id and inc functions
; Show how to implement factorial in terms of product.
(define (factorial n)
  (product id 1 inc n))

(display (factorial 5))

; Also use product to compute approximations to π using the formula:
;
;   π   2*4*4*6*6*8...
;   - = --------------
;   4   3*3*5*5*7*7...
;   
;
; TODO: Finish this

