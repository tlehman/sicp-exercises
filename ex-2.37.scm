; Exercise 2.37: Suppose we represent vectors v=(v_i) as sequences of
; numbers, and matrices m=(m_ij) as sequences of vectors (the rows of
; the matrix). For example, the matrix:
; 
;     | 1 2 3 4 |
;     | 4 5 6 6 |
;     | 6 7 8 9 |
;
; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With
; this representation, we can use sequence operations to concisely
; express the basic matrix and vector operations. These operations
; (which are described in any book on linear algebra) are the
; following: 
; 
; (dot-product v w)       is sum_i(v_i*w_i)
; (matrix-*-vector m v)   is vector t, where t_i = sum_j(m_ij*v_j)
; (matrix-*-matrix m n)   is matrix p, where p_ij = sum_k(m_ik*n_kj) 
; (transpose m)           is matrix n, where n_ij = m_ji
;
; We can define the dot product as:
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following procedures for
; computing the other matrix operations. (The procedure accumulate-n
; is defined in ex-2.36




 ; TODO: Finish this EOF
