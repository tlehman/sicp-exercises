; Exercise 1.18: Using the results of 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling and halving, and uses a logarithmic number of steps.

(define (fast-slim-mult b n)
  (define (iter a b n)
    (let ((even? (lambda (m) (= (remainder m 2) 0)))
	  (double (lambda (m) (+ m m)))
	  (halve (lambda (m) (floor (/ m 2)))))
      (if (= n 0) a
	  (iter (if (even? n) a (+ a b))
		(double b)
		(halve n)))))
  (iter 0 b n))

;(fast-slim-mult 13 11)
;Value: 143
