; Exercise 1.39: A continued fraction representation of the tangent function 
; was published in 1770 by the German mathematician J.H. Lambert:
;                  x
;   tan(x) = -----------------
;            1   -    x²
;                  -----------
;                  3  -   x²
;                       ------
;                       5 - …
;
; where x is in radians. Define a procedure (tan-cf x k) that computes an 
; approximation to the tangent function based on Lambert's formula. 
; k specifies the number of terms to compute, as in Exercise 1.37.

(load "ex-1.37.scm")

(define (tan-cf x k)
  (define (n i) (if (= i 1) x (* -1 x x))) ; x,-x²,-x²,-x², ...
  (define (d i) (- (* 2 i) 1))             ; 1,  3,  5,  7, ...

  (cont-frac n d k))



(tan-cf 1.0 10)  ; -2.18503986326263
(tan-cf 2.0 10)  ;  1.5574077246549    (correct, both checked with M-x calc)

