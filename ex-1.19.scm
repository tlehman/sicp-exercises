; Exercise 1.19: There is a clever algorithm for computing the
; Fibonacci numbers in a logarithmic number of steps.   
; 
; Recall the transformation of the state variables a and b in the
; fib-iter process of Section 1.2.2:  
;   a <--- a + b
;   b <--- a
;
; Call this transformation T, and observe that applying T over and
; over again n times, starting with 1 and 0, produces the pair
; Fib(n+1) and Fib(n). In other words, the Fibonacci numbers are
; produced by applying applying T^n to the pair (0,1). 
;
; Now consider T to be the special case of p=0, q=1 in a family of
; transformations T_pq, where T_pq transforms the pair (a,b) according
; to: 
;   a <--- bq + aq + ap
;   b <--- bp + aq
;
; Show that if we apply such a transformation T_pq twice, the effect
; is the same as using a single transformation T_p'q' of the same
; form, and compute p' and q' in terms of p and q. 
; This gives us an explicit way to square these transformations, and
; thus we can compute T^n using successive squaring, as in the
; fast-expt procedure.
; 
; Put this all together to complete the following procedure, which
; runs in a logarithmic number of steps: 



(define (T p q)
  (lambda (ab)
    (let ((a (car ab))
	  (b (car (cdr ab))))
	  
      (list `(+ (* ,b ,q) (* ,a ,q) (* ,a ,p))
	    `(+ (* ,b ,p) (* ,a ,q))
	    ))))


; T_pq applied once to (a b)
;
;1 ]=> ((T 'p 'q) (list 'a 'b))
;Value 2: ((+ (* b q) (* a q) (* a p)) (+ (* b q) (* a q)))



; T_pq applied twice to (a b);
;
;1 ]=> ((T 'p 'q) ((T 'p 'q) (list 'a 'b)))
;Value 3: ((+ (* (+ (* b q) (* a q)) q) (* (+ (* b q) (* a q) (* a p)) q) (* (+ (* b q) (* a q) (* a p)) p)) (+ (* (+ (* b q) (* a q)) q) (* (+ (* b q) (* a q) (* a p)) q)))

; Using some linear algebra, we can easily solve this problem without code.
; 
; Observe that the action of T_pq on (a,b) is linear, since T_pq(a,b)
;   a <--- bq + aq + ap = (p+q)a + qb
;   b <--- bp + aq      = qa     + pb
; Therefore, T_pq is a 2x2 matrix: 
;          
;  T_pq  =  | (p+q)  q |
;           |   q    p |,  squaring the matrix, we get:
; 
;  T_pq^2 = | ((p+q)^2 + q^2)   (p+q)q + pq  |
;           |   (p+q)q + pq        p^2 + q^2 |

;; Emacs calculator is amazing, I just used 'C-x r C-SPC' to select a
;; region, then used 'C-x * r' to copy the matrix region into Emacs
;; calc, then I used <Enter> to copy it, and then '*' to multiply
;; them. Here is the result:
;; 
;; 1:  [ [ (p + q)^2 + q^2, q*(p + q) + p q ]
;;       [ q*(p + q) + p q,    q^2 + p^2    ] ]

;
; Note that ((p+q)^2 + q^2) = (p^2 + q^2) + (2pq + q^2)
; 
; Then, from this we can derive the values of p' and q' in terms of p and q:
;  
;  p' = p^2 + q^2
;  q' = 2pq + q^2
; 
; Then we can re-write T_pq^2 as T_p'q' = | p'+q'  q' |
;                                         |   q'   p' |

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (p-prime p q) (+ (* p p) (* q q)))
(define (q-prime p q) (+ (* 2 (* p q)) (* q q)))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (p-prime p q)
		   (q-prime p q)
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

;1 ]=> (map fib '(1 2 3 4 5 6 7 8 9))
;Value 4: (1 1 2 3 5 8 13 21 34)
