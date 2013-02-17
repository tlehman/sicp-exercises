; Exercise 1.17: The exponentiation algorithms in this section are based on performing repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following procedure: 

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (fast-mult a b)
  (let ((halve (lambda (n) (/ n 2)))
	(double (lambda (n) (* n 2))))
    (cond ((= b 1) a)
	  ((even? b) (double (fast-mult a (halve b))))
	  (else (+ a (fast-mult a (- b 1)))))))


; (* 101 1301)
;Value: 131401

; (fast-mult 101 1301)
;Value: 131401


	 
