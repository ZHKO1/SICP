(load "SICP/general/general.scm")
(define (compose x y)
  (lambda (z) (x (y z))))

;((compose square inc) 6)

(define (repeated f number)
  (if (= number 1)
      f
      (compose f (repeated f (- number 1)))))
