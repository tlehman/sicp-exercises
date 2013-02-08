; Exercise 1.15: The sine of an angle (specified in radians) and be computed by making use of the approximation sin(x) ~ x if x is sufficiently small, and the trigonometric identity:
;  
;  sin(x) = 3sin(x/3) - 4sin^3(x/3)
;
(define (mysin x) 
  (- (* 3 (sin (/ x 3)))
     (* 4 
	(* (sin (/ x 3)) 
	   (sin (/ x 3)) 
	   (sin (/ x 3))) )))
; For the purposes of this exercise, "sufficiently small" is any angle less than 0.1 radians.
