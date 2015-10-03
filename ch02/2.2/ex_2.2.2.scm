(define x (cons (list 1 2 3) (list 4 5 6)))

(length x)

(define (count-leaves items)
  (cond ((null? items) 0)
        ((not (pair? items)) 1)
        (else (+  (count-leaves (car items))
                  (count-leaves (cdr items))))
      )
)

(count-leaves x)