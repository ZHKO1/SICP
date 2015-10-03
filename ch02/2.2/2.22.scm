(define (square-list items)
  (define (iter things answer)
    (display "things:  ")
    (display things)
    (newline)
    (display " answer: ")
    (display answer)
    (newline)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '())
)

;我觉得应该就是递归的原因
;(square-list (list 1 2 3))
;(2 3) (cons 1 nuil)
;(3)   (cons 2 1)
;所以就是这么一回事

;然后Louis 想修改 交换 (square (car things))和answer
;但就不是(cons number list)的形势
;而是(cons list number)的形势

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (reverse (iter items '()))
)
;我感觉比较蠢，主要是reverse这函数出现的很无厘头
;但是我觉得我也找不到更好的办法了