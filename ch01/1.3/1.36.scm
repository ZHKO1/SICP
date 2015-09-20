(load "SICP/1.3/ex_1.3.3.scm")

(define (fixed-point f first-guess tolerance)
  (define (close-enouge? x y)
    (< (abs (- (abs x) (abs y))) tolerance))
  (define (try guess step)
    (display step)
    (display " ")
    (display guess)
    (newline)
    (let  ((next (f guess)))
          (if (close-enouge? next guess)
              next
              (try next (+ 1 step)))))
  (try first-guess 1)
)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0 0.000001) 
;41步
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0 0.000001) 
;12步