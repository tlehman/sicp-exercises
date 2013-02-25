; Exercise 1.26: Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis' code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:
(load "helpers.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base
				    (- exp 1)
				    m))

; "I don't see what difference that could make," says Louis. "I do." says Eva. "By writing the procedure like that, you have transformed the Theta(log(n)) process into a Theta(n) process". Explain

;; Because of applicative-order evaluation, the expression (expmod base (/ exp 2) m) is computed twice. If Louis had used (square (expmod base (/ exp 2))), the expression (expmod base (/ exp 2)) would only be evaluated once, and the result would be squared. As a result, the double evaluation cancels out the gains in speed we get by using the successive squaring method.
