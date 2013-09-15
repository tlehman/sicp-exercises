; Exercise 2.40: Define a procedure unique-pairs that, given an
; integer n, generates the sequence of pairs (i j) with
; 1 <= j < i <= n
;

(load "helpers.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list j i))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

; Use unique-pairs to simplify the definition of prime-sum-pairs
; given above.

(define (prime-sum-pairs n)
  (filter prime-pair? (eunique-pairs n)))

(define (prime-pair? p)
  (prime? (+ (car p) (cadr p)))) 

;; (prime-sum-pairs 7)
;; ((1 2) (2 3) (1 4) (3 4) (2 5) (1 6) (5 6) (4 7) (6 7))


