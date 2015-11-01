(load "ex_2.3.4.scm")

(define sample-tree
  (make-code-tree (make-leaf 'a 4)
                  (make-code-tree (make-leaf 'b 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))

(define sample-message
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)