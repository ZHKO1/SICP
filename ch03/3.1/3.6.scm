(define rand
  (let ((x 1))
    (lambda (message)
        (cond ((eq? message 'generate)
                (begin (set! x (+ 1 x)) x))
              ((eq? message 'reset)
                (lambda (value) (begin (set! x value) x)))))))