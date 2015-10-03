(define (f x y . z)
  (display x)
  (newline)
  (display y)
  (newline)
  (display z)
  (newline)
  )

(define (g . w)
  (display w)
  (newline)
  )

(f 1 2 3 4 5 6)

(g 1 2 3 4 5 6)

;这里我没有办法优雅的处理cons numb1 (cons numb2 (cons number3 ()
;最后的null我完全不知道该怎么写
(define (same-parity . x)
  (define (out-list items odd?)
    (if (null? items)
      '()
      (let ((item  (car items)))
        (cond ((= (remainder item 2) odd?)
                (cons item (out-list (cdr items) odd?)))
               (else (out-list (cdr items) odd?))))))

  (if (= (remainder (car x) 2) 1)
      (out-list x 1)
      (out-list x 0))
  )

(same-parity 2 2 3 4 5 6 7 8 9 0 10 11)