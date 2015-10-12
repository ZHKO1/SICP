(load "SICP/ch02/2.2/ex_2.2.3.scm")

(define (unique-pairs n)
  (accumulate
    append
    '()
    (map 
      (lambda (i) 
        (map 
          (lambda (j) (list i j))
          (enumerate-interval 1 (- n 1))))
      (enumerate-interval 1 n))))