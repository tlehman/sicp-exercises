; exercise 2.01: define a better version of make-rat that handles both
; positive and negative arguments. make-rat should normalize the sign
; so that if the rational number is postive, both the numerator and
; denominator are postive, and if the rational number is negative,
; only the numerator is negative.

(define (make-rat n d)
  (let ((g (gcd n d))
	(s (/ (* n d) (abs (* n d)))))

    (cons (* s (abs (/ n g)))
	  (abs (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


; gcd(a,b) = gcd(b,a%b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

