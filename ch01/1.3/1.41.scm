(define (double x)
  (lambda (z) (x (x z))))

(((double (double double)) inc) 6)