(car ''a)
;等同于
(car '(quote a))
;等同于
(car (list 'quote 'a))
;所以我们也就看到了
;打印出来的是quote

;但是这里我还有点顾虑
;'(quote a) 和 (list 'quote 'a)是相同的吗？
;而且'(quote a)先算里面的quote a 还是外面算得‘？

(define (apple number)
  (+ apple 1))

(car '(apple 1))
;所以我觉得应该就是外面的quote更佳优先