; Exercise 1.28: One variant of the Fermat test that cannot be fooled
; is called the Miller-Rabin test (Miller 1976; Rabin 1980).  

; This starts from an alternate form of Fermat's little theorem, which
; states that if n is a prime number and a is any positive integer
; less than n, then a^(n-1) is congruent to 1 modulo n.

; To test the primality of a number n by the Miller-Rabin test, we
; pick a random number a < n and raise a to the (n-1)-th power modulo
; n using the expmod procedure. 

; However, whenever we perform the squaring step in expmod, we check
; to see if we have discovered a "nontrivial square root of 1 modulo
; n," that is, a number not equal to 1 or n-1 whose square is equal to
; 1 modulo n. 

;    Definition of 'nontrivial square root of 1 modulo n'
;         a number m such that m*m=1(mod n)  where m is not in {1,n-1}

; It is possible to prove that if such a nontrivial square root of 1
; exists, then n is not prime.  

; It is also possible to prove that if n is an odd number that is not
; prime, then, for at least half the numbers a < n, computing a^(n-1)
; in this way will reveal a nontrivial root of 1 modulo n. (This is
; why the Miller-Rabin test cannot be fooled.)  

;Modify the expmod procedure to signal if it discovers a nontrivial
;square root of 1, and use this to implement the Miller-Rabin test
;with a procedure analogous to fermat-test. 

(define (expmod base exp m)
  (let ((bem
	 (cond ((= exp 0) 1)
	       ((even? exp)
		(remainder (square (expmod base (/ exp 2) m))
			   m))
	       (else
		(remainder (* base (expmod base (- exp 1) m))
			   m)))))
    bem))


; if n not prime => [ a^(n-1)=1(mod n) for at least half of a < n ]
; [ a^(n-1)!=1(mod n) for all a < n ] => n is prime
(define (prime? n)
  
  (define (miller-rabin-test a n)
    (expmod a n n)                   ; a^n mod n
    

  (define (try-miller-rabin-test a n)
    (if (= a n) #t
	(and
	 (miller-rabin-test a n)
       (try-miller-rabin-test (+ a 1) n))))


  (try-miller-rabin-test 1 n)))


