;这回是huffman树
;用0和1的序列来表示数据
;以ASCII标准编码为例，每个字符表示为一个包含7个二进制位的序列

;总结：如果我们需要区分n个不同字符，那么就需要为每个字符使用log2N个二进制位

;以上就是定长编码
;变长编码方式就是用不同数目的二进制位表来表示不同的数据

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf object)
  (cadr object))

(define (weight-leaf object)
  (caddr object))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))
  ))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;这里埋下了伏笔 通用型过程（可以处理多于一种数据的过程）
;这里没有序列直接转化为树的方法 我觉得很蛋疼啊

;解码过程

(define (decode bits tree)
  (define (decode-1 bits current->branch)
    (if (null? bits)
        '()
        (let ((next-branch (choosen-branch (car bits) current->branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree)
)

(define (choosen-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit --CHOOSEN_BRANCH" bit))
      ))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))
      ))

;测试数据
;(adjoin-set (list 'leaf "F" 3.3)
;      (list (list 'leaf "A" 0)
 ;           (list 'leaf "B" 2)
  ;          (list 'leaf "C" 3)
   ;         (list 'leaf "D" 4)
    ;        (list 'leaf "E" 5)))

;归并
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf  (car pair)
                                (cadr pair))
                    (make-leaf-set (cdr pairs))))))






