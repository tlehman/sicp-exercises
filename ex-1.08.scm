; Exercise 1.08: Newton's method for cube roots is based on the fact
; that if y is an approximation to the cube root of x, then a better
; approximation is given by the value 
; 
;       (x/y² + 2y)
;       -----------
;            3
;
; Use this formula to implement a cube-root procedure analogous to
; square-root procedure. (In Section 1.3.4 we will see how to
; implement Newton's method in general as an abstraction of these
; square-root and cube-root procedures.)

(load "helpers.scm")
(load "1_newtons_method.scm")

(define (cube-root x)

  (define (improve guess)
    (let ((y guess))
      (/ (+ (/ x (square y)) (* 2 y)) 3)))

  (define (close-enough? x guess)
    (< (abs (- (cube guess) x)) 0.0001))

  (define (try x guess)
    (if (close-enough? x guess)
	guess
	(try x (improve guess))))

  (try x 1.0))

(cube-root 8)
; 2.0000049116755
