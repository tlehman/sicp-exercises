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

(display (factorial 3))

; Also use product to compute approximations to π using the formula:
;
;   π   2*4*4*6*6*8...  2 4 4 6 6 8 ...  n(n+2)
;   - = --------------  - - - - - - ---  -------
;   4   3*3*5*5*7*7...  3 3 5 5 7 7 ...  (n+1)^2

(load "helpers.scm")

(define (pi-approx steps)
  (let ((f    (lambda (n) (/ (* n (+ n 2)) (* (+ n 1) (+ n 1)))))
        (next (lambda (n) (+ n 2))))
    (product f 2.0 next steps)))

(display (pi-approx 3))

