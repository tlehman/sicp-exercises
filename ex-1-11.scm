; Exercise 1.11: 
;   the Fibonacci numbers, computed tree-recursively:

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))


; (map fib '(0 1 2 3 4 5 6 7 8))
; => (0 1 1 2 3 5 8 13 21)



