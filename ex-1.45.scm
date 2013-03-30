; Exercise 1.45: We saw in Section 1.3.3 that attempting to compute
; square roots by naively finding a fixed point of y ↦ x/y does not
; converge, and that this can be fixed by average damping. The same
; method works for finding cube roots as fixed points of the average-
; damped y ↦ x/y².
;
; Unfortunately, the process does not work for fourth roots - a single
; average damp is not enough to make a fixed point search for y ↦ x/y³
; converge.
; 
; On the other hand, if we average damp twice (i.e. use the average
; damp of y ↦ x/y³), the fixed-point search does not converge.
; 
; Do some experiments to determine how many average damps are required
; to compute the n-th roots as a fixed-point search based upon
; repeated average damping of y ↦ x/y^(n-1)

(load "ex-1.43.scm")  ; <--- this loads helpers.scm too

; Recall that sqrt can be defined as 
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))) 1.0)

(define (nth-root x n)
  (fixed-point (repeated average-damp k) (lambda (y) (/ x y))))

; 
; Use this to implement a simple procedure for computing n-th roots
; using fixed-point, average-damp, and the repeated procedure of
; Exercise 1.43. Assume that any arithmetic operations you need are
; available as primitives.

 ; TODO: Finish this EOF
