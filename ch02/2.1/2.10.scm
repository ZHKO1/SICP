(load "SICP/ch02/2.1/2.7.scm")
(load "SICP/ch02/2.1/2.8.scm")

(define x (make-interval 1 2))
(define y (make-interval -3 5))

(define z (div-interval x y))

(display z)
;按理来说 z的upper应该是无限大的，然而lowwer才是无限小的

(define (div-interval x y)
  (if (< (* (upper-bound y) (lower-bound y)) 0)
      (error "can not div 0")
      (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))

(div-interval x y)