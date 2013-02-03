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
