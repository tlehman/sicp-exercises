; Exercise 1.11: 
;   A function f is defined by the rule that f(n)=n if n < 3 and f(n) = f(n-1)+2f(n-2)+3f(n-3) if n >= 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define (f n) 
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (- n 2)) (* 3 (- n 3)))))  ; Find solution to linear recurrence analytically

;(map f '(1 2 3 4 5 6 7 8))
; => (1 2 4 11 23 40 62 89)

(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
	c
	(f-iter a b c (- count 1))))   ;; FIX
    
  (if (< n 3)
      n
      (f-iter a b c (- count)
      
;
; (map f '(0 1 2 3 4 5 6 7 8 9))
; => (0 1 2 4 11 23 40 62 89 121)


;  the Fibonacci numbers, computed tree-recursively:

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

