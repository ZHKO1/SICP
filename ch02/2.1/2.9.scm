(load "SICP/ch02/2.1/2.7.scm")
(load "SICP/ch02/2.1/2.8.scm")

(define (get-width x)
  (- (cdr x) (car x)))

;(display (get-width x))
;(newline)
;(display (get-width y))
;(newline)
;(display (get-width (add-interval x y)))
;(newline)
;(display (get-width (mul-interval x y)))