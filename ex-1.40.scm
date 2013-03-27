; Exercise 1.40: Define a procedure cubic that can be used together with 
; newtons-method procedure in expressions of the form 
; (newtons-method (cubic a b c) 1)

(load "helpers.scm")

(define (cubic a b c)
  (lambda (x)
    (+ (* a (cube x)) (* b (square x)) c)))

