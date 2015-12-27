(load "ex_3.3.5.scm")
;我觉得基本就是设定b a没法算出来
;比如先给b赋值，然后再给a赋值，接着给出的解混乱了

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
          
          ((and (has-value? product) (eq? m1 m2) )
              (set-value! m1 
                          (sqrt (get-value product))
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

(define A (make-connector))
(define B (make-connector))
(probe "A" A)
(probe "B" B)
(multiplier A A B)
(set-value! A 13 'user)
