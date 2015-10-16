;(a b c)
;((george))
;((y1 y2))
;(y1 y2)
;#f
;(red shoes)
;(red shoes blue socks)
(newline)
(display (list 'a 'b 'c))

(newline)
(display (list (list 'george)))

(newline)
(display (cdr '((x1 y1) (x2 y2))))

(newline)
(display (cadr '((x1 y1) (x2 y2))))

(newline)
(display (pair? (car '(a short list))))

(newline)
(display (memq 'red '((red shoes) (blue socks))))
;这里我理解错误了
;memq的机制是这样的
;(memq item x)
;x 是空的话 就返回错误
;item 和（car x）一样的话 就返回x
;否则就递归（cdr x）

(newline)
(display (memq 'red '(red shoes blue socks)))
