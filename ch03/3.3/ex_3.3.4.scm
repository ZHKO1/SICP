(define a (make-wire))
(define b (make-wire))
(define c (make-wire))

(define d (make-wire))
(define e (make-wire))
(define s (make-wire))

;或
(or-gate a b d)
;与
(and-gate a b c)
;反
(inverter c e)
(and-gate d e s)

(define (half-adder a b s c)
  (let ((d (make-wire))
        (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
  )

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
  'ok))

;这里开始考虑模块化

;返回连线上信号的当前值
(get-signal <wire>)

;给连线上信号新的数值
(set-signal! <wire> <new-value>)

;本来我不太理解这个函数是用来干什么的，后面我看了看
;现在我有点明白了，这个是用来监视连线input变化
;一旦变化就开始触发事件
(add-action! <wire> <procedure of no arg>)

(define (inverter input output)
  (define (inverter-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay  inverter-delay
                    (lambda ()
                            (set-signal! output new-value)))))
  (add-action! input inverter-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))
      ))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value (logical-and (get-signal a1)
                                  (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                           (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
'ok)

(define (logical-and a1 a2)
  (cond ((= a1 0) 0)
        ((= a2 0) 0)
        ((and (= a1 1) (= a2 1)) 1)
        (else (error "Invalid signal" a1 a2))
      ))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or  (get-signal a1)
                                  (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                           (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
)

(define (logical-or a1 a2)
  (cond ((= a1 1) 1)
        ((= a2 1) 1)
        ((and (= a1 0) (= a2 0)) 0)
        (else (error "Invalid signal" a1 a2))
      ))