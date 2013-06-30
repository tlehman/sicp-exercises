; Exercise 2.33: Fill in the missing expressions to complete the
; following definitions of some basic list-manipulation operations as
; accumulations:

(load "helpers.scm")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

;(map (lambda (x) (+ x 2)) '(1 2 3))
; => (3 4 5)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; (append '(a b) '(c d))
; => (a b c d)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

;(length '(a b c d))
; => 4
