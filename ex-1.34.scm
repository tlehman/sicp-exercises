; Exercise 1.34: Suppose we define the procedure:
(define (f g)
  (g 2))

; Then we have
; (f square)
; 4
;
; What happens if we (perversely) ask the interpreter to evaluate 
; the combination (f f)?  Explain.
;
; Because the interpreter uses applicative order evaluation, the 
; argument is evaluated first.
;
; (f f)
; (f 2)
; (2 2)
;
; The program will throw an error, since 2 is not a unary function,
; it's an atom.
