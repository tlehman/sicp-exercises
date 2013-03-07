; Exercise 1.30: The sum procedure generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:
;

(define (sum term a next b)
  (define (iter a result)
    (if (= a b)
        0
        (iter (next a) (+ a result))))
  (iter 0 0))


; TODO: Finish
