; Exercise 2.01: Define a better version of make-rat that handles both
; positive and negative arguments. make-rat should normalize the sign
; so that if the rational number is postive, both the numerator and
; denominator are postive, and if the rational number is negative,
; only the numerator is negative.

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


 ; TODO: Finish this EOF
