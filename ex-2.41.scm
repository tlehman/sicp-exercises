; Exercise 2.41: Write a procedure to find all ordered triples of
; distinct positive integers i, j, and k less than or equal to a
; given integer n that sum to a given integer s. 

(load "ex-2.40.scm") ; for unique-pairs

(define (unique-triples n)
  (flatmap (lambda (i)
	     (map (lambda (p) (append p (list i))) (unique-pairs (- i 1))))
	   (enumerate-interval 1 n)))


(define (solution n s)
  (define (predicate p) (= (+ (car p) (cadr p) (caddr p)) s))
  (filter predicate (unique-triples n)))

;; (solution 20 13)
;; ((3 4 6) (2 5 6) (2 4 7) (1 5 7) (2 3 8) (1 4 8) (1 3 9) (1 2 10))

