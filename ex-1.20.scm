; Exercise 1.20: The process that a procedure generates is of course
; dependent on the rules used by the interpreter. 
; 
; As an example, consider the iterative gcd procedure:

;(define (remainder a b) `(remainder ,a ,b))

(define (gcd a b)
  (if (and (number? b) (= b 0))
       a
       `(gcd ,b (remainder ,a ,b))))

; In normal order evaluation, use the substitution method to illustrate the execution of:
(gcd 206 40)

(gcd 40 (remainder 206 40))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
     (remainder (remainder 40 (remainder 206 40)) 
		(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))


2

;; remainder is called 11 times using normal-order evaluation



; Do the same for applicative order evaluation, compare the number of
; times remainder is called.
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)

2

;; remainder is called 5 times using normal-order evaluation

