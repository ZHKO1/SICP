(load "SICP/ch02/2.2/ex_2.2.3.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                        (+ (* x higher-terms) this-coeff))
              0
              coefficient-sequence))