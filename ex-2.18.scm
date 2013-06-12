; Exercise 2.18: Define a procedure reverse that takes a list as argument
; and returns a list of the same elements in reverse order:
; 
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(define (reverse my-list)

  ; (last '(1 2 3)) #=> 3
  (define (last lst)
    (if (null? lst) lst 
	(if (null? (cdr lst)) (car lst)
	    (last (cdr lst)))))

  ; (beginning '(1 2 3)) #=> (1 2)
  (define (beginning lst)
    (if (or (null? lst) (null? (cdr lst)))
	'() ; throw away the last element
	(cons (car lst) (beginning (cdr lst)))))

  (define (recurse lst)
    (if (null? lst) lst
	(cons (last lst)
	      (recurse (beginning lst)))))

  (recurse my-list))

; (reverse '(1 2 3 4 5))
; => (5 4 3 2 1)
