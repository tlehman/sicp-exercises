; Exercise 2.17: Define a procedure last-pair that returns the list
; that contains only the last element of a given (nonempty) list

(define (last-pair lst)
  (if (or (eq? lst '()) (eq? (cdr lst) '())) lst
      (last-pair (cdr lst))))

; (last-pair (list 1 2 3 4))

;Value 2: (4)
