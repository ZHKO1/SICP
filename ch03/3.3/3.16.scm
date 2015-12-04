(define (count-pairs x)
  (newline)
  (if (pair? x)
      (display x))
  (if (not (pair? x))
      0
      (+  (count-pairs (car x))
          (count-pairs (cdr x))
          1)))

(define (zh_log x)
  (newline)
  (display "==========log:  ")
  (display x))

;这个给出的例子又点绕，我第一的反应是里面的元素的数量，结果是序对的数量 结果感觉就比较绕了

;这是课本给出的例子
(define x (list 'a 'b))
(define y (cons x x))
(zh_log (count-pairs y)) ;结果返回5

(define x1 '(a b c))
(zh_log (count-pairs x1)) ;结果返回3

(define x2 (list 'b))
(define y2 (list 'a))
(define z2 (list y2))
(set-cdr! y2 x2)
(set-cdr! z2 x2)
(zh_log (count-pairs z2)) ;结果返回4

(define x3 (list 'b))
(define y3 (cons x3 x3))
(define z3 (cons y3 y3))
(zh_log (count-pairs z3)) ;结果返回7