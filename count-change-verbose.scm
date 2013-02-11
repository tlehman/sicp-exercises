; Count Change

(define (count-change amount)
  (cc amount 5))

; (f a b) -> (f b c), evaluating to (f b c)
(define (display-edge f a b c d)
  (begin 
    (display "\"")
    (display `(f ,a ,b))
    (display "\" -> \"")
    (display `(f ,c ,d))
    (display "\"\n")
    (f c d)))
    

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ 
	       (display-edge cc amount kinds-of-coins 
			     amount (- kinds-of-coins 1))
	       (display-edge cc amount kinds-of-coins 
			     (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
	       )
	      )))

					; first-denomination takes the number of kinds of coins and returns the denomination of the first kind
  (define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
	  ((= kinds-of-coins 2) 5)
	  ((= kinds-of-coins 3) 10)
	  ((= kinds-of-coins 4) 25)
	  ((= kinds-of-coins 5) 50)))

(count-change 11)
