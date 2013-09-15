; Exercise 2.59: Implement the union-set operation for the unordered
; list representation of sets.


(load "helpers.scm") ; for element-of-set?

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (let ((x1 (car set1)))
	(union-set (cdr set1)
		   (adjoin-set x1 set2)))))

