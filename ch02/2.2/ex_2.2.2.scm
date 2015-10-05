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

;对树的映射
(define (scale-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))
      ))

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (scale-tree sub-tree factor)
            (* sub-tree factor))) tree))