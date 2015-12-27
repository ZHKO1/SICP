;这个有点叼....又是开眼界的节奏

;先看连接器给出的概念 (make-connector)
;(has-value? <connector>)
;(get-value <connector>)
;(set-value! <connector> <new-value> <informant>)
;(forget-value! <connector> <retractor>)
;(connect <connector> <new-constraint>)

;adder 和multiplier 都是两个约束器


(define (inform-about-value constraint)
  (constraint 'have-a-value))
(define (inform-about-no-value constraint)
  (constraint 'forget-a-value))

(define (make-connector)
  (let ((value false) (informant false) (constraints '()))
    (define (set-my-value newval setter)
      (cond ((not (has-value? me))
              (set! value newval)
              (set! informant setter)
              (for-each-except setter
                               inform-about-value
                               constraints))
            ((not (= value newval)) 
              (error "Contradiction" (list value newval)))
            (else 'ignored)))
    (define (forget-my-value retractor)
      (if (eq? retractor informant)
          (begin (set! informant false)
                 (for-each-except retractor
                                  inform-about-no-value
                                  constraints))
          'ignored))
    (define (connect new-constraint)
      (if (not (memq new-constraint constraints))
          (set! constraints (cons new-constraint constraints)))
      (if (has-value? me)
          (inform-about-value new-constraint))
    'done)
    (define (me request)
      (cond ((eq? request 'has-value)
              (if informant true false))
            ((eq? request 'value)
              value)
            ((eq? request 'set-value!) set-my-value)
            ((eq? request 'forget) forget-my-value)
            ((eq? request 'connect) connect)
            (else (error "Unkown operation -- CONNECTOR" request))
          ))
  me))

(define (for-each-except exception procedure list)
  (define (loop items)
    (cond ((null? items) 'done)
          ((eq? (car items) exception) (loop (cdr items)))
          (else (procedure (car items))
                (loop (cdr items)))
        ))
  (loop list))

(define (has-value? connector)
  (connector 'has-value))

(define (get-value connector)
  (connector 'value))

(define (set-value! connector new-value informant)
  ((connector 'set-value!) new-value informant))

(define (forget-value! connector retractor)
  ((connector 'forget) retractor))

(define (connect connector new-constraint)
  ((connector 'connect) new-constraint))

(define (adder a1 a2 sum)
  (define (process-new-value)

    (cond ((and (has-value? a1) (has-value? a2))
              (set-value! sum 
                          (+ (get-value a1) (get-value a2))
                          me))
          ((and (has-value? a1) (has-value? sum))
              (set-value! a2 
                          (- (get-value sum) (get-value a1))
                          me))
            
          ((and (has-value? a2) (has-value? sum))
              (set-value! a1 
                          (- (get-value sum) (get-value a2))
                          me))
            ))
  (define (process-forget-value)
    (forget-value! sum me)
    (forget-value! a1 me)
    (forget-value! a2 me))
  (define (me request)
    (cond ((eq? request 'have-a-value) (process-new-value))
          ((eq? request 'forget-a-value) (process-forget-value))
          (else (error "Unkown request --Adder" request))
        ))
  (connect a1 me)
  (connect a2 me)
  (connect sum me)
  me)

(define (multiplier m1 m2 product)
  (define (process-new-value)
    (cond ((or (and (has-value? m1) (= (get-value m1) 0))
               (and (has-value? m2) (= (get-value m2) 0))
            )
           (set-value! product 0 me))
          ((and (has-value? m1) (has-value? m2))
              (set-value! product 
                          (* (get-value m1) (get-value m2))
                          me))
            
          ((and (has-value? m1) (has-value? product))
              (set-value! m2 
                          (/ (get-value product) (get-value m1))
                          me))
            
          ((and (has-value? m2) (has-value? product))
              (set-value! m1 
                          (/ (get-value product) (get-value m2))
                          me))
            ))
  (define (process-forget-value)
    (forget-value! m1 me)
    (forget-value! m2 me)
    (forget-value! product me))
  (define (me request)
    (cond ((eq? request 'have-a-value) (process-new-value))
          ((eq? request 'forget-a-value) (process-forget-value))
          (else (error "Unkown request --Multiplier" request))
        ))
  (connect m1 me)
  (connect m2 me)
  (connect product me)
  me)

(define (constant value connector)
  (define (me request)
    (error "Unkown request --CONSTANT" request))
  (connect connector me)
  (set-value! connector value me)
me)


(define (probe name connector)
  (define (print-probe value)
    (newline)
    (display "Probe: ")
    (display name)
    (display " == ")
    (display value))
  (define (process-new-value)
    (print-probe (get-value connector)))
  (define (process-forget-value)
    (print-probe "?"))
  (define (me request)
    (cond ((eq? request 'have-a-value) (process-new-value))
          ((eq? request 'forget-a-value) (process-forget-value))
          (else 
            (error "Unkown request --PROBE" request))
        ))
  (connect connector me)
  me)

(define (celsius-fathrenheit-converter c f)
  (let ((u (make-connector))
        (v (make-connector))
        (w (make-connector))
        (x (make-connector))
        (y (make-connector)))
    (multiplier c w u)
    (multiplier v x u)
    (adder v y f)
    (constant 9 w)
    (constant 5 x)
    (constant 32 y)
  'ok))

;(adder a b c)
;比如 a b c 这三个可以用adder来达成协约，不论何时何刻，a+b总归会等于c
;(define C (make-connector))
;(define F (make-connector))

;(probe "C" C)
;(probe "F" F)
;(celsius-fathrenheit-converter C F)
;达成协议 9C ＝ 5(F - 32)


;这里开始总结思路






