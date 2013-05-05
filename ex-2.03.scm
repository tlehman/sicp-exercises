; Exercise 2.03: Implement a representation for rectangles in a plane.
; (Hint: you may want to make use of exercise 2.02)
;
; In terms of your constructors and selectors, create procedures that
; compute the perimeter and area of a given rectangle.;

(load "ex-2.02.scm")


; 
;  o----------------------------
;  |			       |
;  |			       |
;  ----------------------------O
;
(define (make-rectangle top-left bottom-right)
  (cons top-left bottom-right))

(define (width rectangle)
  (abs (- (x-point (car rectangle)) (x-point (cdr rectangle)))))

(define (height rectangle)
  (abs (- (y-point (car rectangle)) (y-point (cdr rectangle)) )))

;
; Now implement a different representation for rectangles. Can you
; design your system with suitable abstraction barriers, so that the
; same perimeter and area procedures will work using either
; representation?
;  

(define (make-rectangle' width height)
  (cons width height))

(define (width' rectangle) (car rectangle))
(define (height' rectangle) (cdr rectangle))




;; test values (area: 12, perim: 14)
(define a (make-point -2 3))
(define b (make-point 1 -1))
(define r (make-rectangle a b))
(define w (width r))
(define h (height r))
(define r' (make-rectangle' w h))


(define (area rectangle)
  (* (width 
