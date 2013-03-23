; Exercise 1.36: Modify fixed-point so that it prints the sequence of approximations 
;   it generates, using newline and display primitives shown in Exercise 1.22. 
;
;   Then find a solution to x^x = 1000 by finding a fixed point of x ↦ log(1000)/log(x)
;
;     x^x = 1000
;     log(x^x) = log(1000)
;     x*log(x) = log(1000)
;     x = log(1000)/log(x) 

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess))) 
      (if (close-enough? guess next)
        next
        (try next))))

  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             1.1)

