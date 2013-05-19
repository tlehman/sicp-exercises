; Exercise 2.05: Show that we can represent pairs of non-negative
; integers using only numbers and arithmetic operations if we
; represent the pair a and b as the integer (2^a)(3^b)
; 
; Give the corresponding definitions of the procedures cons, car and
; cdr.

(load "helpers.scm")
(load "ex-1.16.scm")
(define (expt b n) (fast-expt b n)) 

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car c)
  (define (multiple-of-2? n) (= (remainder n 2) 0))

  (define (reduce-2 c)
    (if (multiple-of-2? c)
	(+ 1 (reduce-2 (/ c 2)))
	0))
  (reduce-2 c))

(define (cdr c)
  (define (multiple-of-3? n) (= (remainder n 3) 0))

  (define (reduce-3 c)
    (if (multiple-of-3? c)
	(+ 1 (reduce-3 (/ c 3)))
	0))
  (reduce-3 c))

;; (car (cons 10 44))
;; 10

;; (cdr (cons 10 44))
;; 44
