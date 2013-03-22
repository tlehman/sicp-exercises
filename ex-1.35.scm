; Exercise 1.35: Show that the golden ratio φ is a fixed point
;   of the transformation x ↦ 1+1/x, and use this face to 
;   compute φ by means of the fixed-point prodcedure.

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))

  (try first-guess))

(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.00))
; 1.61805555555556

