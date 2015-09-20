(load "SICP/ch01/1.3/ex_sum.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
      (iter (next a) (+ result (term a)))))
  (iter a 0)
  )

(sum (lambda (x) x)
  1 (lambda (x) (+ x 1)) 3
)
