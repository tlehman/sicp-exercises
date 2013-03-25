; Exercise 1.37: An infinite continued fraction is an expression of the form 
;
;                   N₁
;       f = -----------------
;            D₁   +     N₂
;                   ---------
;                   D₂ +  N₃
;                        ----
;                        D₃+…
;
; As an example, one can show that the infinite continued fraction expansion 
; with the Nᵢ and Dᵢ all equal to 1 produces 1/φ, where φ is the golden ratio.
;
; One way to approximate an infinite continued fraction is to truncate the 
; expansion after a given number of terms. Such a truncation is called a 
; k-term finite continued fraction.
;
; Suppose that n and d are procedures of one argument (the term index i) such
; that: 
;
;     (n i) = Nᵢ
;     (d i) = Dᵢ
;
; a. Define a procedure cont-frac such that evaluating 
; (cont-frac n d k) computes the value of the k-term finite continued 
; fraction. Check your procedure by approximating 1/φ using 
;
;   (cont-frac (lambda (i) 1.0)
;              (lambda (i) 1.0)
;              k)
;
; For succesive values of k.
;
(define (cont-frac n d k)
  (define (recurse i)
    (if (= i k)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (recurse (+ i 1))))))

  (recurse 1))

; How large must you make k in order to get an approximation that is accurate 
; to 4 decimal places?
;
;    NOTE: Compute until the difference between steps is < 0.0001

(define (one-over-phi-approx)
  (define (n k) 1.0)
  (define (d k) 1.0)
  (define (close-enough? x y) (< (abs (- x y)) 0.0001))

  (define (try k)
    (let ((current (cont-frac n d k))
          (next    (cont-frac n d (+ k 1))))
      (if (close-enough? current next)
	  next
          (try (+ k 1)))))

  (try 1))

(one-over-phi-approx)
; (0.618055555555556. 10)
;    the answer to 1.37a is k < 11

;
; b. If your cont-frac procedure generates a recursive process, write one that 
; generates an iterative process. If it generates an iterative process, write 
; one that generates a recursive process.

(define (cont-frac-iterative n d k)
  (define (iterate i result)
    (if (= i k)
	result
        (iterate (+ i 1) (/ (n i) (+ (d i) result)))))

  (iterate 1 0.0))


(cont-frac (lambda (x) 1.0)
	   (lambda (x) 1.0)
	   25)

