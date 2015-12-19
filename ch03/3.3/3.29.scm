(load "ex_3.3.4.scm")

(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
        (c2 (make-wire))
        (c3 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 c3)
    (inverter c3 output)
  )
)

;后面一个小题 第一反应是需要用到and-gate-delay还有inverter-delay来给加到里面去
;结果也就只是并算而已.....话说时间线是怎么处理的.....