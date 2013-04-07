; Exercise 1.13: Prove that Fib(n) is the closest integer to 
;   (phi^n)/(sqrt(5))        ; (/ (pow phi n) (sqrt 5))
;   
;  where phi = (1 + sqrt(5))/2
; 
;  Let psi = (1 - sqrt(5))/2.
;  
;  To prove that Fib(n) = (phi^n - psi^n)/sqrt(5), observe that 
;  Fib(n) = Fib(n-1) + Fib(n-2). Now suppose that Fib(n) = r^n.
;  Then, 
;     r^n = r^(n-1)  +  r^(n-2)   ; by hypothesis
;     r^2 = r + 1                 ; divide out r^(n-2)
;  Solving for r, 
;     r^2 - r - 1 = 0
;     r = (1 +/- sqrt(4 - (-1)^2))/2
;       = (1 +/- sqrt(5))/2
;  Thefore, r = phi or r = psi. And since the Fibonacci 
;  recurrence is linear, sums of solutions are new solutions.
;  
;  Given the base cases that Fib(0) = 0, Fib(1) = 1, we simply 
;  need to show that Fib(n) = (phi^n - psi^n)/sqrt(5) for n = 0 
;  or n = 1. 
; 
;  For n = 0, phi^0-psi^1 = 0
;  For n = 1, phi - psi = sqrt(5), so (phi-psi)/sqrt(5) = 1, 
;  This completes the proof.
