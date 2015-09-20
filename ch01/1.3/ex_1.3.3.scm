(define (average a b)
        (/ (+ a b) 2)
)

    
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