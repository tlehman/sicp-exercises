;; binary-tree.scm
;; 
;; the following tree:
; 
;       4
;      / \
;     1   7
;    /   / \
;   0   5   9
;
;; will be represented in Scheme as

(define tree '(4
	       (1
		(0 () ())
		())
	       (7
		(5 () ())
		(9 () ()))))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;; If representing a set as a binary tree:
(define (element-of-set? x s)
  (cond ((null? s)       #f)
	((= x (entry s)) #t)
	((< x (entry s))
	 (element-of-set? x (left-branch s)))
	((> x (entry s))
	 (element-of-set? x (right-branch s)))))

(element-of-set? 1 tree)

