(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))


(define (for-each fun items)
  (define (next-each items)
    (fun (car items))
    (for-each fun (cdr items))
    )
  (if (not (null? items))
      (next-each items)))

(for-each (lambda (x) (newline) (display x))
          (list 1 2 3 4 5 6))

;这里我还是不太确定我做得对不对
;很可能搞一个例子 我就挂了
;我有这种不详的预感