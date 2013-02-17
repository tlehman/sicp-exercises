; Exercise 1.19: There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. 
; 
; Recall the transformation of the state variables a and b in the fib-iter process of Section 1.2.2: 
;   a <--- a + b
;   b <--- a
;
; Call this transformation T, and observe that applying T over and over again n times, starting with 1 and 0, produces the pair Fib(n+1) and Fib(n). In other words, the Fibonacci numbers are produced by applying applying T^n to the pair (0,1).
;
; Now consider T to be the special case of p=0, q=1 in a family of transformations T_pq, where T_pq transforms the pair (a,b) according to:
;   a <--- bq + aq + ap        ; a <--- b + a + 0  ; T = T_01 (Fib is special case of T_pq)
;   b <--- bp + aq             ; b <--- 0 + a      ; 
