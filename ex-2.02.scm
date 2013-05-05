; Exercise 2.02: Consider the problem of representing line segments in
; a plane. Each segment is represented as a pair of points: a starting
; point and and ending point.
; 
; Define a constructor make-segment and selectors start-segment and
; end-segment that define the representation of segments in terms of
; points.
; 
; Furthermore, a point can be represented as a pair of
; numbers: the x any y coordinates. Accordingly, specify a constructor
; make-point and selectors x-point and y-point that define this
; representation. Finally, using your selectors and constructors,
; define a procedure midpoint segment that takes a line segment as
; argument and returns its midpoint (that point whose coordinates are
; the average of the coordinates of the endpoints). To try your
; procedures, you'll need a way to print points:

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define a (make-point -1.2 3.18))
(define b (make-point 0.2 12.03327))
(define ab (make-segment a b))

(display (eq? a (start-segment ab)))
(newline)
(display (eq? b (end-segment ab)))
(newline)
; #t
; #t
