; Exercise 1.43: If f is a numerical function an n is a postive integer, then we can form 
; the n-th repeated application of f, which is defined to be the function whose value at 
; x is f(f(...(f(x))...)) = fⁿ(x)
; 
; Write a procedure that takes as inputs a procedure that computes f and a positive integer
; n, and returns the procedure that computes the n-th repeated application of f. Your 
; procedure should be used as follows:
; 
; ((repeated square 2) 5)
; 625
; 
; Hint: You may find it convenient to use compose from Exercise 1.42.

(load "ex-1.42.scm")

(define (repeated f n)
  (define (recurse i)
    (if (= i 1)
	f
	(compose f (recurse (- i 1)))))
  (recurse n))

; ((repeated square 2) 5)
; 625

;; ((repeated sin 3) 1.0)
;; 0.67843047736074
;; guile> (sin (sin (sin 1.0)))
;; 0.67843047736074
