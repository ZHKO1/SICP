;这里举出了两个例子
;我们来看看作者装的什么逼
;这两段函数之间的差距总结一下

;sum-odd-squares
;1.枚举出一颗树的树叶
;2.过滤它们，选出其中的奇数
;3.对于选出来的每一个数字求平方
;4.用+ 累积起得到的结果，从0开始
;enumerate
;filter
;map
;accumulate

;even-fibs
;1.枚举出从0到n的整数
;2.对于每个整数计算相应的fib数
;3.过滤他们，选出其中的偶数
;4.用cons累积得到的结果，从空表来开始
;enumerate
;map
;filter
;accumulate



(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
          (if (odd? tree)
            (square tree)
            0))
        (else (+  (sum-odd-squares (car tree))
                  (sum-odd-squares (cdr tree))))
      ))
;

(define (fib number)
  (if (= number 0)
      0
      (+ number (fib (- number 1)))))


(define (even-fibs n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0)
)

;开始序列操作

;过滤
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
          (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
      ))

;积累
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

;枚举
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
      ))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ 1 low) high))))


(define (sum-odd-squares tree)
  (accumulate + 
              0
              (map square 
                          (filter odd? (enumerate-tree tree)))
            ))

(define (even-fibs n)
  (accumulate cons
              '()
              (filter even? (map fib (enumerate-interval 0 n)))
    ))

;不愧是SICP 抽象思维玩得飞起