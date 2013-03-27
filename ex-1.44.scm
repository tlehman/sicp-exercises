; Exercise 1.44: The idea of smoothing a function is an important concept in signal processing.
; If f is a function and dx is some small number, then the smoothed version of f is the 
; function whose value at a point x is the average of f(x - dx), f(x) and f(x + dx).
; 
; Write a procedure smooth that takes as input a procedure that computes f and returns a 
; procedure that computes the smoothed f.

(load "helpers.scm")
(load "ex-1.43.scm")

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
	  (f x)
	  (f (+ x dx)))
       3)))

; It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed 
; function, and so on) to obtain that n-fold smoothed function.
; 
; Show how to generate the n-fold smoothed function of any given function using smooth and 
; repeated from Exercise 1.43


(define (n-fold-smooth f n)
  (repeated (smooth f) n))

(plot (n-fold-smooth sin 1000) 0 6.0 0.01)

