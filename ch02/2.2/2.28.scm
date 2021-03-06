(load "SICP/ch02/2.2/2.17.scm")
(load "SICP/ch02/2.2/2.18.scm")
(define (fringe items)
  (cond ((null? items) '())
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))
      )
)

(display (fringe (list 19 (list 1 2 (list 7 4 5)) (list 3 4))))