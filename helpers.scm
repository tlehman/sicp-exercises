(define (id x) x)
(define (inc n) (+ n 1))
(define (even? n) (= (remainder n 2) 0))
(define (odd? n) (= (remainder n 2) 1))
(define (divides? d n) (= (remainder n d) 0))
(define (square n) (* n n))
(define (cube n) (* n n n))
(define (invert n) (/ 1 n))
(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
  (lambda (x)
    (average x (f x))))

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




;; plotting stuff
;; 
;; awful procedural code
;;  |
;;  |
;;  v
(define (plot f x-min x-max step)
  (define (iter i x)
    (if (> x x-max)
	(begin)
	(begin
	  (display x)
	  (display " ")
	  (display (f x))
	  (newline)

	  (plot f (+ x step) x-max step))))

    (iter 1 x-min))

(define (plot-two f g x-min x-max step)
  (define (iter i x)
    (if (> x x-max)
	(begin)
	(begin
	  (display x)
	  (display " ")
	  (display (f x))
	  (display " ")
	  (display (g x))
	  (newline)

	  (plot-two f g (+ x step) x-max step))))

    (iter 1 x-min))



;; End of chapter 1 stuff (a.k.a the good stuff)

(define dx 0.00001)

(define (deriv f)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x))
       dx)))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))

  (try first-guess))

(define tolerance 0.0001)

(define (newton-transform f)
  (lambda (x)
    (- x (/ (f x) 
	    ((deriv f) x)))))

(define (newtons-method f guess)
  (fixed-point (newton-transform f) guess))


(define (accumulate op first list)
  (if (null? list) first
      (op (car list)
	  (accumulate op first (cdr list)))))
