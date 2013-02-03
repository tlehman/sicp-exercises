; Exercise 1.11: 
;   A function f is defined by the rule that f(n)=n if n < 3 and f(n) = f(n-1)+2f(n-2)+3f(n-3) if n >= 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define (f n) 
  (if (< n 3)
      n
      (+ (f (- n 1)) 
	 (* 2 (f (- n 2))) 
	 (* 3 (f (- n 3))))))  ; Find solution to linear recurrence analytically

; (map f '(0 1 2 3 4 5 6 7 8 9))
; => (0 1 2 4 11 25 59 142 335 796)
; 

; f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
; 
;  a <- b
;  b <- c 
;  c <- c + 2b + 3a

(define (g n)
  (define (iter a b c count)
    (if (= count 0)
	a
	(iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  
  (iter 0 1 2 n))

