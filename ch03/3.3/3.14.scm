(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x)
        )))
  (loop x '()))

;a b c d / ()
;b c d   / a
;c d     / b a
;d       / c b a
;        / d c b a

;如上所述 就是倒转的作用

(define v (list 'a 'b 'c))
;此时 v也就是a b c而已 没什么特别的
(define w (mystery v))
;此时 w则是c b a 不过a同时也被v指向
;换句话说 v 是 a