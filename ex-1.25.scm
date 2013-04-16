; Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of
; extra work in writing expmod. After all, she says, since we already
; know how to compute exponentials, we could have simple written 

(define (expmod base exp m)
  (remainder (fast-expt base exp) m)) 

; Is she correct?
;   Yes.

; Would this procedure serve as well for our fast prime tester? Explain.
;   No, since it has to compute the whole exponentiation and then take
;   the remainder, this is not as fast as expmod defined in helpers.scm
