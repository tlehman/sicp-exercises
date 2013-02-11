; Count Change

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (begin
    (cond ((= amount 0) 1)
	  ((or (< amount 0) (= kinds-of-coins 0)) 0)
	  (else (+ 
		 (begin 
		   (display "\"")
		   (display `(cc ,amount ,kinds-of-coins))
		   (display "\"")
		   (display " -> ")
		   (display "\"")
		   (display `(cc ,amount ,(- kinds-of-coins 1)))
		   (display "\"")
		   (display "\n")
		   (cc amount (- kinds-of-coins 1))
		   )
		 (begin 
		   (display "\"")
		   (display `(cc ,amount ,kinds-of-coins))
		   (display "\"")
		   (display " -> ")
		   (display "\"")
		   (display `(cc ,(- amount (first-denomination kinds-of-coins)) ,kinds-of-coins))
		   (display "\"")
		   (display "\n")
		   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
		   )
		 )
		))))

					; first-denomination takes the number of kinds of coins and returns the denomination of the first kind
  (define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
	  ((= kinds-of-coins 2) 5)
	  ((= kinds-of-coins 3) 10)
	  ((= kinds-of-coins 4) 25)
	  ((= kinds-of-coins 5) 50)))

(count-change 11)
