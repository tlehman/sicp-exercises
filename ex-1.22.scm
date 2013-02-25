; Exercise 1.22: Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running. The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

(load "helpers.scm")
(define (runtime) (tms:clock (times)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define primes-found 0)  ; every time you see a global variable, you have to drink

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin
	(set! primes-found (+ primes-found 1))
	(newline)
	(display n)
	(report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes 

;larger than 1,000,000,000,000         (one trillion)
;larger than 1,000,000,000,000,000     (one quadrillion)
;larger than 1,000,000,000,000,000,000 (one quintillion)

(define (search-for-primes lower-bound upper-bound)
  (if (and (<= lower-bound upper-bound) (< primes-found 3))
      (begin (timed-prime-test lower-bound)
	     (search-for-primes (+ lower-bound 2) upper-bound))
      (begin
	(set! primes-found 0)
	(newline))))

(search-for-primes 100000000001 999999999999)
(search-for-primes 100000000000001 999999999999999)
(search-for-primes 100000000000000001 999999999999999999)


; Note the time needed for each prime. Since the testing algorithm has order of growth Theta(sqrt(n)), you should expect that the testing for primes around 1e12 should take about sqrt(10) as long as testing for primes around 1e15. For the record, sqrt(10) is about 3.1

;; 100000000003 *** 17
;; 100000000019 *** 16
;; 100000000057 *** 16
;;                  16.3 (average)

;; 100000000000031 *** 513
;; 100000000000067 *** 514
;; 100000000000097 *** 517
;;                     514.67 (average)

;(/ 514.67 16.3)
;Value: 31.574846625766867

;; 100000000000000003 *** 16516
;; 100000000000000013 *** 16682
;; 100000000000000019 *** 16471
;;                        16556.33 (average)

;(/ 16556.33 514.67)
;Value: 32.16882662677056

;; The average ratio between jumps of three orders of magnitude is 31.87

; Do your timing data bear this out?


; How well do the data for 100,000 and 1,000,000 support the Theta(sqrt(n)) prediction?


; Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?
;;

; TODO: Finish me

(newline)
