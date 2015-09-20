(load "SICP/ch01/1.3.3/ex_1.3.3.scm")
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 0.5 0.00001)
(fixed-point (lambda (x) (average x (+ 1 (/ 1 x)))) 1.0 0.00001) 