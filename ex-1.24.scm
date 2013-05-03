; Exercise 1.24: Modify the timed-prime-test procedure of Exercise
; 1.22 to use fast-prime? (the Fermat method), and test each of the
; 12 primes you found in that exercise.

(load "helpers.scm")

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))

  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(load "ex-1.22.scm")

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (begin
	(set! primes-found (+ primes-found 1))
	(newline)
	(display n)
	(report-prime (- (runtime) start-time)))))

(search-for-primes 100000000001 999999999999)

;(search-for-primes 100000000000001 999999999999999)
;(search-for-primes 100000000000000001 999999999999999999)



			  

; Since the Fermat test has Theta(log(n)) growth, how would you
; expect the time to test primes near 1e12 to compare with the time
; to test primes near 1e15?

; Do your data bear this out?

; Can you explain any discrepancy you find?

; TODO: Finish this
