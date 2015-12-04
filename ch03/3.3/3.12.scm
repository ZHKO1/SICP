(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))

(define z (append x y))
(newline)
(display x)
(newline)
(display y)
(newline)
(display z)

; X - > (list 'a 'b)
; Y - > (list 'c 'd)
; Z - > 'a 'b (list 'c 'd) a 和 b和X无关 但是c和d依旧还是Y指针所指向的数据结构
(define w (append! x y))
(newline)
(display x)
(newline)
(display y)
(newline)
(display w)
; X - > (list 'a 'b 'c 'd)
; Y - > (list 'c 'd)
; Z ＝ X

