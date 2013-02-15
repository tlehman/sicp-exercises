; Exercise 1.42: Let f and g be two one-argument functions, define a procedure compose that returns the composition of f and g.

(define (compose f g)
  (lambda (x)
    (f (g x))))


(define (square x) (* x x))
; => square

(define (invert x) (/ 1 x))
; => invert

((compose square invert) 2)
; => 1/4    ; (1/2)^2 = 1/4


