;又一次进化了 这回是玩二叉树了
;二叉树（number left-branch right-branch）

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((> x (entry set)) (element-of-set? x (right-branch set)))
        ((< x (entry set)) (element-of-set? x (left-branch set)))
      ))

;想了想 还是很有必要搞一个借口 将表转化成树 以及将树转化成表

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) 
          (make-tree  (entry set)
                      (adjoin-set x (left-branch set))
                      (right-branch set)))
        ((> x (entry set)) 
          (make-tree  (entry set)
                      (left-branch set)
                      (adjoin-set x (right-branch set))))))


