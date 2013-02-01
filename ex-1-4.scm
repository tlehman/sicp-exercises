; Exercise 1.4: Observe that our model of computation allows for combinations whose operators are compound expressions.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -)) a b)
; => a-plus-abs-b

(a-plus-abs-b 24 -7)  ; FIX THIS


