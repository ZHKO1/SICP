(load "2.67.scm")
(load "ex_2.3.4.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-tree symbol tree result)
    (cond ((and (leaf? tree) (isExisted symbol (symbols tree))) (append result '()))
          ((not (isExisted symbol (symbols tree))) (error "symbol is not isExisted in tree: " symbol))
          ((isExisted symbol (symbols (left-branch tree)))  (encode-symbol-tree symbol (left-branch tree) (append result (list 0))))
          ((isExisted symbol (symbols (right-branch tree))) (encode-symbol-tree symbol (right-branch tree) (append result (list 1))))
        )
    )
  (encode-symbol-tree symbol tree '())
)

;我怎么总感觉应该要添加一个函数来判断特定元素是否在数组内？
;这里我完全忘了 是不是这么写的 有没有原生的函数方法.....
(define (isExisted one list)
  (cond ((null? list) #f)
        ((and (eq? one list) (not (pair? list)))  #t)
        ((eq? one (car list)) #t)
        (else (isExisted one (cdr list)))
      ))