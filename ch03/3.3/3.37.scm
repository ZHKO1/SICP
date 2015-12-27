(load "ex_3.3.5.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
  z))

(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
  z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
  z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
  z))

(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
  z))

;9C ＝ 5(F - 32)

(define (celsius-fathrenheit-converter C)
  (c+ (c* (c/ (cv 9) (cv 5))
          C)
      (cv 32)))

(define C (make-connector))

(define F (celsius-fathrenheit-converter C))
(probe "C" C)
(probe "F" F)