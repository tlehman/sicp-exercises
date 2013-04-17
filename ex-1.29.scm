; Exercise 1.29: Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using Simpson's Rule,
; the integral of a function f between a and b is approximated as
; 
;  h
;  - (y_0+4y_1+2y_2+4y_3+2y_4+...+4y_(n-2)+2y_(n-1)+y_n)
;  3
;
; where h = (b-a)/n, for some even integer n, and y_k=f(a + kh).
; (Increasing n increases the accuracy of the approximation.)
;
; Define a procedure that takes as arguments f, a, b, and n and
; returns the value of the integral, computed using Simpson's Rule.
; 
; Use your procedure to integrate cube between 0 and 1 with (n = 100
; and n = 1000), and compare the results to those of the integral
; procedure defined here:

(load "ex-1.32.scm") ; to get the sum procedure
(load "helpers.scm") ; to get the cubem procedure

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(define (integral-simpson f a b n)
  (let ((h (/ (- b a) n))
	(cy (lambda (k) 
	      (let (c (cond ((or (= k 0) (= k n)) 1)
		       ((even? k) 2)
		       (else 4)))
		(* c (f (+ a (* k h)))))))
    (* (/ h 3) (sum cy 0 inc n)))))

; TODO: Finish
