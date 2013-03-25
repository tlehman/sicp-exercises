; Exercise 1.38: In 1737, the Swiss Mathematician Leonhard Euler published a
; memoir De Fractionibus Continuis, which included a continued fraction 
; expansion for e - 2, where e is the base of the natural logarithm. 
; 
; In this fraction, the Nᵢ are 1 and the Dᵢ are successively:
; 
;    1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...  (OEIS A003417)
; 
; Write a program that uses your cont-frac procedure from Exercise 1.37 to 
; approximate e, based on Euler's expansion.

(load "ex-1.37.scm")


(define n (lambda (i) 1.0))
(define d (lambda (i) (if (= (remainder (+ i 1) 3) 0)
			  (* 2 (/ (+ i 1) 3))
			  1)))

(map d '(1 2 3 4 5 6 7 8 9 10 11 12 13))
; (1 2 1 1 4 1 1 6 1 1 8 1 1)

(define (e-approx steps)
  (+ 2 (cont-frac n d steps)))


(e-approx 10)
; 2.71828171828172
