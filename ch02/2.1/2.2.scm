(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (make-segment x y)
  (cons x y))

(define (start-segment p)
  (car p))

(define (end-segment p)
  (cdr p))

(define (midpoint-segment p)
  (let ((x1 (x-point (start-segment p)))
        (y1 (y-point (start-segment p)))
        (x2 (x-point (end-segment p)))
        (y2 (y-point (end-segment p)))
      )
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))


(define x (make-point 2 3))

(define y (make-point 1 3))

(define z (make-segment x y))

(midpoint-segment z)