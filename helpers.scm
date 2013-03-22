(define (id x) x)
(define (inc n) (+ n 1))
(define (even? n) (= (remainder n 2) 0))
(define (odd? n) (= (remainder n 2) 1))
(define (divides? d n) (= (remainder n d) 0))
(define (square n) (* n n))
(define (cube n) (* n n n))
(define (invert n) (/ 1 n))

(define (find-divisor n d)
  (cond ((divides? d n) d)
	((> (square d) n) n)
	(else (find-divisor n (+ d 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n) (and 
                     (= n (smallest-divisor n))
                     (> n 1)))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) 
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else 
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


