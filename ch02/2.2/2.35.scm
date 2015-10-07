(load "SICP/ch02/2.2/ex_2.2.3.scm")

;我的第一想法就是先全部转化成深度为1的表再说，然后直接效仿length
;但是我感觉这里似乎没有那么简单啊

(define (count-leaves t)
  (cond ((null? t) 0)
        ((not (pair? t)) 1)
        (else (+ (count-leaves (car t)) (count-leaves (cdr t))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) (if (not (pair? x)) 1 0)) (enumerate-tree t))))