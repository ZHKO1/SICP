(define (last-pair x)
  (display x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c 'd)))

;z
;(last-pair z)
;我不知道别人运行会怎么样 反正我这边是彻底卡爆了 就是这么悲伤