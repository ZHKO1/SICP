;卧槽 这回要玩大的啊
;(list a b) 返回的值为包含a变量的值以及b变量的值的列表
;作者就想玩(a b)这招 直接包含a变量本身以及 b变量本身
(define a 1)
(define b 2)

(newline)
(display (list a b))

(newline)
(display (list 'a 'b))

(newline)
(display (list 'a b))

(newline)
(display (list 'a b))

(newline)
(display (car '(a b c)))

(define (memq item x)
  (newline)
  (display x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))
      ))

;还是以系统自带函数为准 这里教材大概是给个思路