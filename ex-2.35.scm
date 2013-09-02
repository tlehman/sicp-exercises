; Exercise 2.35: Redefine count-leaves from Section 2.2.2 as an
; accumulation:

; from Section 2.2.2
(define (count-leaves t)
  (cond ((null? t) 0)
	((not (pair? t)) 1)
	(else (+ (count-leaves (car t))
		 (count-leaves (cdr t))))))

(load "helpers.scm") ; for (accumulate op first list)

(define (count-leaves tree)
  (accumulate +
	      0
	      (map (lambda (sub-tree)
		     (if (pair? sub-tree)
			 (let ((first (car sub-tree))
			       (rest (cdr sub-tree)))
			   (+ (if (pair? first) (count-leaves first) 1)
			      (if (pair? rest) (count-leaves rest) 1)))
			 1))
		   tree)))

; Note: I really hate how I solved this, the conditionals inside the
; let statement evaluates pair? of the car and the cdr of the cons cell
; that just had pair? evaluated on it. The cyclomatic complexity is
; high, just to avoid passing atoms into count-leaves. There has to be
; a better way.

; I think that a flatten procedure would dramatically simplify this problem.
