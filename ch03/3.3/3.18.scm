(load "3.13.scm")
(define (boolean-cycle? x)
  (let ((temp (cdr x)))
    (begin (set-cdr! x '()) (eq? (car x) (car (last-pair temp))))))

;我还是想得太简单了 不是这个是不是环，而是这个是否是包含环？
;也就是说如果是

(define test-cycle (make-cycle (list 'a 'b 'c)))
(define test1 (list 'd 'e))

(set-cdr! (last-pair test1) test-cycle)
;这样的话 我的解法就隔屁掉了，更加严重的是还有一种办法也能让我的解法隔屁掉
;那就是

(define test2 (list 'd 'e 'd))
;防不胜防啊，我完全没法处理啊混蛋
