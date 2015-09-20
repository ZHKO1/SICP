(define (f x y)
  (define (f-helper a b)
    (+  (* x (square a))
        (* y b)
        (* a b)))
  (f-helper (+ 1 (* x y)) (- 1 y))
)

;这里开始思考用lambda来解决问题
(define (f x y)
  ((lambda (a b) (+  (* x (square a))
        (* y b)
        (* a b)))
    (+ 1 (* x y)) 
    (- 1 y)))

;思考用let来解决问题
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+  (* x (square a))
        (* y b)
        (* a b))))

