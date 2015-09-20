(load "SICP/ch01/1.3/ex_sum.scm")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
      (iter (next a) (* result (term a)))))
  (iter a 1)
  )

(define (product term a next b)
 (if (> a b)
      1
      (* (term a) (product term (next a) next b)))
  )

(* 4 (product (lambda (x) (/ (* x 1.0 (+ x 2)) (* (+ x 1) (+ x 1))))
  2 (lambda (x) (+ x 2)) 200))

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 3)

;(lambda (x) x) 没出错

;(lambda (x) (x)) 出错了
