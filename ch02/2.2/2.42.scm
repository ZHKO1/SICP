(load "SICP/ch02/2.2/ex_2.2.3.scm")

;这道题比较难 昨天下午一直想到现在
;我简单介绍下我的思路
;首先(queens-cols k)的意思就是包含着前k列的几种布局方式
;(list 布局1 布局2 布局3 .... 布局n)
;然后我这里 每个布局都是以(list x1 x2 x3 ... xn)的方式来表达
;xn的含义就是在第n列位于第xn行有个皇后
;定义清楚了 后面也就好办多了

(define (adjoin-position row col rest-of-queens)
  (append rest-of-queens (list row))
)

(define (safe? k positions)
  (define (single-queen-safe? k new-queen x old-queen)
    (let ((a-row new-queen)
          (a-col k)
          (b-row old-queen)
          (b-col x))
      (and (not (= a-row b-row)) (not (= (abs (- a-row b-row)) (abs (- a-col b-col))))))
  )
  (if (<= k 1)
      #t
      (let ((new-queen (list-ref positions (- k 1))))
        (accumulate (lambda (x y) (and x y))
                    #t
                    (map (lambda (x) (single-queen-safe? k
                                             new-queen
                                             x
                                             (list-ref positions (- x 1))))
                         (enumerate-interval 1 (- k 1))))
        )))


(define (queens board-size)
  (define (queens-cols k)
    (if (= k 0)
        (list '())
        (filter (lambda (positions) (safe? k positions))
                (flatmap
                  (lambda (rest-of-queens)
                    (map (lambda (new-row)
                                 (adjoin-position new-row k rest-of-queens))
                         (enumerate-interval 1 board-size)))
                  (queens-cols (- k 1)))
             )
      ))
  (queens-cols board-size)
)

(define (print-chessboard items)
  (newline)
  (display (car items))
  (if (not (null? (cdr items)))
      (print-chessboard (cdr items)))
)

;最后测试语句
;(print-chessboard (queens 8))
