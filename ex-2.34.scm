; Exercise 2.34: Evaluating a polynomial in x at a given value of x can
; be formulated as an accumulation. We evaluate the polynomial
; 
;   (a_n)x^n + (a_(n-1))x^(n-1) + ... + (a_1)x + a_0
;
; using a well-known algorithm called Horner's rule, which structures
; the computation as
;
; (...([a_n]x + [a_n-1])x + ... + a_1)x + a_0      (nested binomials)
;
; In other words, we start with a_n, multiply by x, add a_{n-1},
; multiply by x, and so on, until we reach a_0.
;
; Fill in the following template to produce a procedure that evaluates
; a polynomial using Horner’s rule. Assume that the coefficients of
; the polynomial are arranged in a sequence, from a_0 through a_n.

(load "ex-1.16.scm")  ; <--- for fast-expt

; for this problem, we need an increasing integer, we will solve this 
; problem with a functional iterator pow!

(define (make-pow!)
  (let ((pow 0))  ; local variable captured by closure below
    (lambda ()
      (let ((oldpow pow))
	(begin
	  (set! pow (+ pow 1))
	  oldpow)))))  ; increment pow

(define pow! (make-pow!))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coef higher-terms)
		(if (eq? higher-terms '())
		    0
		    (* this-coef (fast-expt x (pow!)))))
		0
		coefficient-sequence))

; For example, to compute 1 + 3x + 5x^2 + x^5 at x=2, you would eval:
(horner-eval 2 '(1 3 0 5 0 1))
; => 512

