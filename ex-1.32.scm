; Exercise 1.32(a): Show that sum and product (Exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
;   (accumulate combiner null-value term a next b)
;
; Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. 
;
; Write accumulate and show how sum and product can both be defined as simple calls to accumulate.
;                                           range
;                    binOp      unit    ,-----------,
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum f a next b)
  (accumulate + 0 f a next b))

(define (product f a next b)
  (accumulate * 1 f a next b))

(load "ex-1.30.scm")   ; to get the id and inc functions
(display (sum id 0 inc 5))
(display "\n")
; 15


(display (product id 1 inc 5))
(display "\n")
; 120

; Exercise 1.32(b): If your accumulate procedure generates a recursive process, write one that generates an iterative process, or vice-versa.
;
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))


;(display (product id 1 inc 5))
; 120
