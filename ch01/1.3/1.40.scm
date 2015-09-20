(load "SICP/ch01/1.3/ex_1.3.4.scm")

(define (cubic a b c)
    (lambda (x) (+ (* x x x) (* x x a) (* x b) c)))
  

(define (solved a b c)
  (newton-method (cubic a b c) 1.0))
