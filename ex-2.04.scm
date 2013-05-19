; Exercise 2.04: Here is an alternative representation of pairs. For
; this representation, verify that (car (cons x y)) = x, for all
; objects x and y.

(define (cons x y) (lambda (m) (m x y)))
(define (car z) (z (lambda (p q) p)))

; What is the corresponding definition of cdr?
(define (cdr z) (z (lambda (p q) q)))

;(cdr (cons 'x 'y))
; => y


