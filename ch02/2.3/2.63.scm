(load "ex_2.3.3_tree.scm")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
   (define (copy-to-list tree result-list)
     (if (null? tree)
         result-list
         (copy-to-list (left-branch tree)
                       (cons (entry tree)
                             (copy-to-list (right-branch tree)
                                            result-list)))))
 (copy-to-list tree '()))



;a 是相同的
;b tree->list-1多了一个append 所以复杂度要多了