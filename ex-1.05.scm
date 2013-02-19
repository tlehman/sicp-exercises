; Exercise 1.5: There is a test to determine whether the interpreter one is faced with is using applicative-order evaluation or normal-order evaluation. The following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Then, when the expression:
(test 0 (p))
; is evaluated, what will happen
;  with Applicative order evaluation, (test 0 (p)) would evaluate
					;   0 and then (p), which would evaluate to (p), 
					;   which would evaluate to (p) ... ad infinitum

;  with Normal order evaluation, test would be evaluated first, passing in 0 and (p), and since
					; (= 0 0) evaluates to #t, the entire expression would 
					; evaluate to 0
