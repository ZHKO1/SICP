(define (make-accumlator number)
  (define (add num)
    (set! number (+ number num))
    number)
add)

(define A
  (make-accumlator 100))