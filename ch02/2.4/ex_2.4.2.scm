(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- Type-Tag" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))

(define (rectangular? z)
  (eq? (type-tag z) 'rectangular))

(define (polar? z)
  (eq? (type-tag z) 'polar))

(define (real-part-rectangular z)
  (car z))

(define (imag-part-rectangular z)
  (cdr z))

(define (magnitude-rectangular z)
  (sqrt (+ (square (real-part-rectangular z))
           (square (imag-part-rectangular z)))))

(define (angle-rectangular z)
  (atan (imag-part-rectangular z) (real-part-rectangular z)))

(define (make-from-real-imag-rectangular x y)
  (attach-tag 'rectangular (cons x y)))

(define (make-from-mag-ang-rectangular r a)
  (attach-tag 'polar (cons (* r (cos a)) (* r (sin a)))))


;这里是polat的机制
(define (real-part-polar z)
  (* (magnitude-polar z) (cos (angle-polar z))))

(define (imag-part-polar z)
  (* (magnitude-polar z) (sin (angle-polar z))))

(define (magnitude-polar z)
  (car z))

(define (magnitude-polar z)
  (cdr z))

(define (make-from-real-imag-polar x y)
  (attach-tag 'polar (cons  (sqrt (+ (square x) (square y)))
                            (atan y x))))

(define (make-from-mag-ang-polar r a)
  (attach-tag 'polar (cons r a)))

(define (real-part z)
  (cond ((rectangular? z)
         (real-part-rectangular (contents z)))
        ((polar? z) (real-part-polar (contents z)))
      (else (error "Unknown type --Real-part" z))))

(define (imag-part z)
  ())

(define (magnitude z)
  ())

(define (angle z)
  ())

;上面我就懒的打了
;妈的 我都打了这么多 我都特么佩服我自己
;ex_2.4.1 的add-complex还能用
;前提是
(define (make-from-real-imag x y)
  (make-from-real-imag-rectangular x y))


(define (make-from-mag-ang r a)
  (make-from-mag-ang-polar r a))