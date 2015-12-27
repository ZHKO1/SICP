;定义一条线路
;初始化值
;保存需要触发的过程并立即触发 保证这个时刻的状态是正确的

(define (make-wire)
  (let ((signal-value 0)
        (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
          (begin (set! signal-value new-value)
                 (call-each action-procedures))
          'done))
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))
    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unkown operation -- WIRE" m))
          ))
  dispatch))

(define (call-each procedures)
  (if (null? procedures)
      'done
      (begin ((car procedures))
             (call-each (cdr procedures)))))

(define (get-signal wire)
  (wire 'get-signal))

(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))

;待处理表的时间判断

;返回一个新的空的待处理表
;(make-agenda)
;待处理表是否是空的？
;(empty-agenda? <agenda>)
;待处理表返回第一个
;(first-agenda-item <agenda>)
;待处理表删除第一个
;(remove-first-agenda-item! <agenda>)
;待处理表添加时间
;(add-to-agenda! <time> <action> <agenda>)
;返回当时的模拟时间
;(current-time <agenda>)

(define (make-time-segment time queue)
  (cons time queue))

(define (seqment-time s)
  (car s))

(define (seqment-queue s)
  (cdr s))

(define (make-agenda) (list 0))

(define (current-time agenda)
  (car agenda))

(define (set-current-time! agenda time)
  (set-car! agenda time))

(define (segments agenda)
  (cdr agenda))

(define (set-segments! agenda segments)
  (set-cdr! agenda segments))

(define (first-segment agenda)
    (car (segments agenda)))

(define (rest-segments agenda)
    (cdr (segments agenda)))

(define (empty-agenda? agenda)
  (null? (segments agenda)))



(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))

(define (propagate)
  (if (empty-agenda? the-agenda)
      'done
      (let ((first-item (first-agenda-item the-agenda)))
        (first-item)
        (remove-first-agenda-item! the-agenda)
        (propagate)
      )))

(define (probe name wire)
  (add-action! wire
               (lambda ()
                       (newline)
                       (display name)
                       (display " ")
                       (display (current-time the-agenda))
                       (display " new-value= ")
                       (display (get-signal wire))
                     )))

;开始抽象化定义
(define (half-adder a b s c)
  (let ((d (make-wire))
        (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
  'ok))

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
;(get-signal <wire>)

;给连线上信号新的数值
;(set-signal! <wire> <new-value>)

;本来我不太理解这个函数是用来干什么的，后面我看了看
;现在我有点明白了，这个是用来监视连线input变化
;一旦变化就开始触发事件
;(add-action! <wire> <procedure of no arg>)

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