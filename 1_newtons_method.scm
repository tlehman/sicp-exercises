; SICP Chapter 1: Computing Square Roots
(define (abs x)
  (if (< x 0) (- x)
      x))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))

 (define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

;; Exercise 1.6
;; What happens if one defines new-if in terms of cond, 
;; and then uses that new-if in the sqrt function?
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))
;Aborting!: maximum recursion depth exceeded
;; 
;; The reason this happens is that ordinary functions in Scheme
;; use applicative-order evaluation, so the operands are computed 
;; first, which never terminates, due to the recursion being used 
;; in an incorrect way. Therefore, the special form IF must exist.
