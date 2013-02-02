; Exercise 1.6: Alyssa P. Hacker doesn't see why 'if' needs to be provided as a special form. "Why can't I just define it as an ordinary procedure in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims that this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)
; => 5

(new-if (= 1 1) 0 5)
; => 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

; What happens when Alyssa attempts to use this to compute square roots?
; 
;   The applicative order evaluation will attempt to evaluate (sqrt-iter (improve guess x)) first, which will never end, so a stack overflow will occur. What Alyssa P. Hacker doesn't realize is that the special form version of 'if' is necessary to avoid this problem with recursive procedures.
