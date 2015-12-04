(define test1 (cons 'a 'b))

(set-car! test1 'c)
(newline)
(display test1)

(set-cdr! test1 'd)
(newline)
(display test1)

;这里我发现set!赋予变量数值的话 还是会返回这个变量原来的值
;但是set-car!却不一样，不返回数值