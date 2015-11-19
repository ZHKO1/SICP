(define (make-mounitiored fun)
  (let ((number 1))
    (lambda (x)
          (cond ((eq? x 'how-many-calls) number)
                ((eq? x 'reset-count) (begin (set! number 0) number))
                (else (begin (set! number (+ number 1)) (fun x)))                
              ))))

(define s (make-mounitiored sqrt))
