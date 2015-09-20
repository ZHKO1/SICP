(define (average a b)
        (/ (+ a b) 2)
)

;这里我手贱多了一个参数 tolerance 精度 后面调用到这也多了这个参数
(define (fixed-point f first-guess tolerance)
  (define (close-enouge? x y)
    (< (abs (- (abs x) (abs y))) tolerance))
  (define (try guess)
    (let  ((next (f guess)))
          (if (close-enouge? next guess)
              next
              (try next))))
  (try first-guess)
)

;(fixed-point cos 1.0 0.00001)