; Exercise 1.41: Define a procedure double that takes a procedure of one argument and returns a procedure that applies the original procedure twice
;

(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc n) (+ n 1))

(inc 1)
; => 2

((double inc) 1)
; => 3

