(load "ex_3.3.5.scm")
(define (averager-converter a b c)
  (let ((u (make-connector))
        (y (make-connector)))
    (multiplier u c y)
    (adder a b y)
    (constant 2 u)
  'ok))

(define A (make-connector))
(define B (make-connector))
(define C (make-connector))

(probe "A" A)
(probe "B" B)
(probe "C" C)
(averager-converter A B C)

(set-value! A 13 'user)