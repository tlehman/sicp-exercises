; some scheme utilties to make things easier
(define (range n)
  (define (backwards-range n)
    (if (= n 0)
	'(0)
	(cons n (backwards-range (- n 1)))))
  (reverse (backwards-range n)))

