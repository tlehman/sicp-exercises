; Exercise 1.42: Let f and g be two one-argument functions, define a procedure compose that returns the composition of f and g.

(load "helpers.scm")

(define (compose f g)
  (lambda (x)
    (f (g x))))


((compose square invert) 2)
; => 1/4    ; (1/2)^2 = 1/4


