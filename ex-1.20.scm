; Exercise 1.20: The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure:

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; In normal order evaluation, use the substitution method to illustrate the execution of:
(gcd 206 40)

; Do the same for applicative order evaluation, compare the number of times remainder is called.





