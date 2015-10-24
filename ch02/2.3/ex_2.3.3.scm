;好了 开始搞集合了
;妈的 最近任务越来越多 然后还没头没脑去玩合金装备了

;这里重新温故下eq? 和 equal? 区别
;基本过程eq? 以两个符号作为参数 检查它们是否为同样的符号
;equal? 比较包含符号的表 也能比较包含数值的表

;确定某个给定元素是不是某个给定集合的成员
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))
      ))

;以一个对象和一个集合为参数，返回一个集合
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

;计算两个集合的并集
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (append (list (car set1)) (union-set (cdr set1) set2)))
      ))

;计算两个集合的交集
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
          (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))
      ))