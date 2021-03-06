(load "ex_3.3.5.scm")
(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "Square less than 0 --Square" (get-value b))
            (set-value! a (sqrt (get-value b)) me))
        (if (has-value? a)
            (set-value! b (square (get-value a)) me))))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'have-a-value) (process-new-value))
          ((eq? request 'forget-a-value) (process-forget-value))
          (else (error "Unkown request --Squarer" request))
        ))
  (connect a me)
  (connect b me)
  me)

(define A (make-connector))
(define B (make-connector))
(probe "A" A)
(probe "B" B)
(squarer A B)
;(set-value! A 13 'user)
(set-value! B 13 'user)