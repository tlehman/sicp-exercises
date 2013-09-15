; Exercise 2.39: Complete the following definitions of reverse in
; terms of fold-left and fold-right from Exercise 2.38

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)))
	      nil
	      sequence))

; (reverse '(a b c d e))
; => (e d c b a)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

; (reverse '(a b c d e))
; => (e d c b a)


