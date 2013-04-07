; Count Change

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else `(+ (cc ,amount             
		      ,(- kinds-of-coins 1)) ; the # of ways to change
					; a using all but the first
					; kind of coin
		  (cc ,(- amount
			  (first-denomination kinds-of-coins))
		      ,kinds-of-coins) ; the # of ways to change a-d
					; where d is the first denomination
		  ))))

; first-denomination takes the number of kinds of coins and returns
; the denomination of the first kind
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))



(display (cc 11 5))

; TODO: Finish
