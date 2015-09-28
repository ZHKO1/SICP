(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (define (caring x i)
    (if (= (remainder x 2) 0)
        (caring (/ x 2) (+ i 1))
        i))
  (caring x 0))

(define (cdr x)
  (define (cdring x i)
    (if (= x 1)
        i
        (cdring (/ x 3) (+ i 1))))
  (let ((y (/ x (expt 2 (car x)))))
    (cdring y 0))
  )
