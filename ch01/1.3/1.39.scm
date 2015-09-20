(load "SICP/ch01/1.3/1.37.scm")

(define (tan-cf x step)
        (exact->inexact (cont-frac  (lambda (i) (if (= i 1)
                                    x
                                    (- (* x x))))
                    (lambda (i) (- (* 2 i) 1))
                    step)))
                    
(tan-cf 10 100)