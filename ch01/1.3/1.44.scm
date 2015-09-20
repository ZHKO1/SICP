(define dx 0.0000001)
(define (smooth fx)
  (lambda (x) (/ (+ (fx (+ x dx))
                    (fx x)
                    (fx (- x dx))) 3)))

(define (smooths fx number)
  ((repeated smooth number) fx))
