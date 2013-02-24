; Exercise 1.21: Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999

(load "helpers.scm")

(define (smallest-divisor-for-each list)
  (if (eq? '() list)
      '()
      (cons (smallest-divisor (car list)) (smallest-divisor-for-each (cdr list)))))

;1 ]=> (smallest-divisor-for-each '(199 1999 19999))
;Value 2: (199 1999 7)
      
