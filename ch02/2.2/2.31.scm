(define (tree-map fun tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (fun tree))
        (else (cons (tree-map fun (car tree)) (tree-map fun (cdr tree))))
      ))

(define (square-tree tree)
  (tree-map square tree))