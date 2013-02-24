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

(define (prime? n) (= n (smallest-divisor n)))
