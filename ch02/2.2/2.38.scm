(load "SICP/ch02/2.2/ex_2.2.3.scm")

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence)
)

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (fold-right op initial (cdr sequence)))))

;这里我们来拿最简单的例子来探讨一下
;比如op为＋ initial为0 sequence为(list 1 2 3)
;fold-left
;(1 + 2 + 3 ) 算数从左边开始算起来
;fold-right
;(+ 1 (+ 2 (+ 3))) 算数从右边开始算起来
(newline)
(display (fold-right / 1 (list 1 2 3)))
(newline)
(display (fold-left / 1 (list 1 2 3)))
(newline)
(display (fold-right list '() (list 1 2 3)))
(newline)
(display (fold-right list '() (list 1 2 3)))

;op 前后交换不影响结果

