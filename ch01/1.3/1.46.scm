(load "SICP/ch01/1.3/ex_1.3.3.scm")
(load "SICP/ch01/1.3/ex_1.3.4.scm")
(load "SICP/ch01/1.3/1.43.scm")
(define tolerance 0.00001)


(define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    
(define (iterative-improve f close-enough?)
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (lambda (first-guess)(try first-guess)))

(define (sqrt2 x)
  ((iterative-improve (average-damp (lambda (y) (/ x y)))  close-enough?) 1.0))

(define (fixed-point2 f first-guess)
  ((iterative-improve f close-enough?) first-guess))
