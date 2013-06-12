; Exercise 2.06: In case representing pairs with procedures wasn't
; mind-boggling enough, consider that, in a language that can
; manipulate procedures, we can get by without numbers by implementing
; 0 and the operation of adding 1 as:

; \sz.z 
(define zero (lambda (s)
	       (lambda (z) z))

; \nfx.f(nfx)
(define add-1 (lambda (n)
		(lambda (f)
		  (lambda (x)
		    (f ((n f) x))))))

; This representation is know as Church numerals, after its inventor,
; Alonzo Church, the logician who invented lambda calculus.
; 
; (2.06) Define 1 and 2 directly:

;; (add-1 zero)

;; (lambda (f)
;;   (lambda (x)
;;     (f ((zero f) x))))

;; (lambda (f)
;;   (lambda (x)
;;     (f (id x))))

;; (lambda (f)
;;   (lambda (x)
;;     (f x)))

(define one (lambda (f)
	      (lambda (x)
		(f x))))

(define two (lambda (f)
	      (lambda (x)
		(f (f x)))))

; Give a direct definition of the addition procedure + 
(define (+ a b)
  ((a add-1) b))
;; From Rojas' "A Tutorial Introduction to the Lambda Calculus",
;; http://www.utdallas.edu/~gupta/courses/apl/lambda.pdf 
;; 
;; Addition of Church numerals a and b was derived using the successor
;; function S as ((aS)b)

