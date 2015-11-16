(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      (error "Insufficient funds" amount)))

;其实吧 我觉得这代码.....该怎么说呢 感觉真特么繁琐
;果然为了函数方式编程就变成这样子了

;这里有两个重点
;1.set! 的作用是将第二个参数的值给赋予第一个参数。但是整体还是返回第一个参数的值
;2.begin 似乎也没咋用 就是单纯按照顺序来计算各个表达式的值，最后返回最后一个表达式的值

;其实严格点的写法是这样的
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount)) balance)
                (error "Insufficient funds" amount)))))

;这里说到了新的问题 
;就是本来都是求值的代换模型 也就是讲过程的形式参数用对应的值取代后求值取代之后求值
;现在就出了新的麻烦 一旦在语言里引入了赋值，代换就不再合适作为过程应用的模型了

(define (make-withdraw balance)
  (lambda (amount)
          (if (>= balance amount)
              (begin (set! balance (- balance amount))  balance)
              "Insufficient funds")))

(define W1 (make-withdraw 100))

(define W2 (make-withdraw 100))

;这么一看这两个对象就是相互完全互相独立的对象。每个对象都有自己局部状态变量balance

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (depost amount)
    (begin (set! balance (+ amount balance))
    balance))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'depost) depost)))
  dispatch
)

(define acc1 (make-account 100))
(define acc2 (make-account 100))

;这里我碰到问题了 我完全不知道如何重新清空状态
