; Exercise 1.3: Define a procedure that takes three numbers and 
;               returns the sum of the squares of the larger ones.

(define (sum-sq-max-two a b c)
  (define (max x y) (if (< x y) y x))
  (define (square x) (* x x))
  (+ (square (max a b)) (square (max b c))))
	
;(sum-sq-max-two 2 3 4)
; => 25
