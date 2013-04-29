; Exercise 1.27: Demonstrate that Carmichael numbers listed in
; Footnote 1.47 really do fool the Fermat test. That is, write a
; procedure that takes an integer n and tests whether a^n is congruent
; to (a mod n) for every a < n, and try your procedure on the given
; Carmichael numbers. 

; Fermat's Little Theorem: If n is a prime number and a is any
; positive integer less than n, then a raised to the n-th power is
; congruent a modulo n 

;           (n is prime)  implies    (a^n mod n = a (mod n))
; (a^n mod n = a (mod n))  does not imply   (n is prime)

; 561, 1105, 1729, 2465, 2821, 6601 are Carmichael numbers

(load "helpers.scm")

(define test-numbers 
  '(561 1105 1729 2465 2821 6601)) ; http://oeis.org/A002997

(define (fermat-test a n)
  (= (expmod a n n) a))

(define (carmichael? n)

  (define (try-fermat-test a n)
    (if (= a n) #t
	(and 
	 (fermat-test a n)
	 (try-fermat-test (+ a 1) n))))

  (try-fermat-test 1 n))

;(map carmichael? test-numbers)
;Value 2: (#t #t #t #t #t #t)
