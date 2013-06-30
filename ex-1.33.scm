; Exercise 1.33: You can obtain an even more general version of
; accumulate (Exercise 1.32) by introducing the notion of a filter on
; the terms to be combined. That is, combine only those terms derived
; from values in the range that satisfy a specified condition. The
; resulting filtered-accumulate abstraction takes the same arguments
; as accumulate, together with an additional predicate of one argument
; that specifies the filter.  
;
; Write filtered-accumulate as a procedure. 

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a result)
    (if (> a b)
      result

      (iter (next a) (combiner (term (if (predicate a)
                                         a
                                         null-value))
                               result))
      ))
  (iter a null-value))

(load "helpers.scm")
(define (sum-even f a next b)
  (filtered-accumulate + 0 f a next b even?))

(display (sum-even id 1 inc 10))

; Show how to express the following using filtered-accumulate
;
;   a. the sum of the squares of the prime numbers in the interval a to b 
;      (assuming that you have a prime? predicate already written)
(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

(display "\n")

(display (sum-square-prime 1 10))
; 2*2 + 3*3 + 5*5 + 7*7 = 87

;   b. the product of all the positive integers less than n that are relatively 
;      prime to n (i.e., all positive integers i < n such that gcd(i,n)=1)

  (define (product-positive-coprime-less-than n)
    (let ((predicate (lambda (i) (and (> i 0)
                                      (< i n)
                                      (= (gcd i n) 1)))))
    (filtered-accumulate * 1 id 1 inc n predicate)))

(display "\n")

(display (product-positive-coprime-less-than 10))
; 1*3*7*9 = 189
