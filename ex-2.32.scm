; Exercise 2.32: We can represent a set as a list of distinct
; elements, and we can represent the set of all subsets of the set as
; a list of lists. For example, if the set is (1 2 3), then the set of
; all subsets is (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)). 
;
; Complete the following definition of a procedure that generates the
; set of subsets of a set and give a clear explanation of why it
; works:

(load "helpers.scm")

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x))
			  rest)))))

; The reason this works is that for any set S and any x, either:
;   (x in S) exclusive OR (x not in S)
; 
; Therefore, the power set P(S) of S is the following union:
;   P(S) = {P(S-x)} U {{x} U T | where T in P(S-x) } for each x in S
; 
; the implmentation of the above equation in Scheme was done by
; letting append be union, rest be P(S-x), and the lambda expression
; represented {x} U T.
