(define (make-rat n d)
  (cons n d))

(define (number x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x)(denom y))))

(define (sub-rat x y)
  (make-rat (- (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x)(denom y))))

(define (mul-rat x y)
  (make-rat (- (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x)(denom y))))



(define x (make-rat 2 3))

(define y (make-rat 1 3))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x))
)

;(print-rat (add-rat x y))
