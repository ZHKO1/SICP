(load "SICP/general/general.scm")
(define (compose x y)
  (lambda (z) (x (y z))))

;((compose square inc) 6)