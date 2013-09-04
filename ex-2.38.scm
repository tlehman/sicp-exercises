; Exercise 2.38: The accumulate procedure is also known as fold-right,
; because it combines the first element of the sequence with the
; result of comining all the elements to the right.
;
; There is also a fold-left, which is similar to fold-right, except
; that it combines elements working in the opposite direction.
;
; (fold-right * '(a b c d))
; => (* a (* b (* c d)))
; ## infix: (a * (b * (c * d)))
; 
; (fold-left * '(a b c d))
; => (* (* (* a b) c) d)
; ## infix: (((a * b) * c) * d)

(load "helpers.scm")

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter init seq))

 ; TODO: Finish this EOF

(define fold-right accumulate)

; What are the values of
; 
; (fold-right / 1 (list 1 2 3))
; => 3/2
;
; (fold-left / 1 (list 1 2 3))
; => 1/6

;; guile> (define / (lambda (x y) `(/ ,x ,y)))
;; guile> (fold-left / 1 (list 1 2 3))
;; (/ (/ (/ 1 1) 2) 3)
;; guile> (fold-right / 1 (list 1 2 3))
;; (/ 1 (/ 2 (/ 3 1)))


