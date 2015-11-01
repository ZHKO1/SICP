(load "ex_2.3.3_sorted.scm")
(load "2.63.scm")
(load "2.64.scm")

(define (union-tree tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1) (tree->list-2 tree2))))

(define (intersection-tree tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1) (tree->list-2 tree2))))

;测试数据
;(intersection-tree (list->tree (list 1 3 5 7 9 11)) (list->tree (list 2 4 6 7 9 11)))

;其实这个办法是很简单的
;但是就是因为看上去很没技术含量，所以我感觉有点不对劲
;想用其他办法吧，又难得一逼....只好作罢