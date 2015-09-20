(load "SICP/ch01/1.3/ex_sum.scm")

(define (integral_new f a b n)
  
  (define h (/ (- b a) n))
  
  (define (y k)
    (+ a (* k h)))
  
  (define (fachor k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          ((odd? k) 4)
        ))
  
  (define (term_ k)
    (* (fachor k) (f (y k))))
  
  (define (next x)
    (+ x 1))
  
  (*  (sum term_ (exact->inexact 0) next n) (/ h 3))
)
