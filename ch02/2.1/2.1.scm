(load "SICP/ch02/2.1/ex_2.1.1.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (= d 0)
        (display "worry")
        (cons (/ (* n d) (* g (abs d))) (/ (* d d) (* g (abs d)))))))

(print-rat (make-rat 2 1))