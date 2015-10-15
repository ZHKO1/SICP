(load "SICP/ch02/2.2/ex_2.2.3.scm")

(define (out-all-threes n)
  (accumulate append
              '()
              (flatmap (lambda (x)
                       (map (lambda (y)
                                    (map (lambda (z) (list x y z))
                                         (remove y (remove x (enumerate-interval 1 (- y 1))))))
                            (enumerate-interval 1 (- x 1))))
              (enumerate-interval 1 n))))

(define (out-threes n s)
  (filter (lambda (x) (= s (+ (car x) (list-ref x 1) (list-ref x 2)))) (out-all-threes n)))