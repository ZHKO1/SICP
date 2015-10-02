;(list 2 1 3 4 5)

;为什么这个就不管用？
;(cons 1 (cons 2 (cons 3 nil)))

;(define one-through-four (list 1 2 3 4))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))


(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length items)
  (define (length-iter items count)
    (if (null? items)
        count
        (length-iter (cdr items) (+ 1 count))))
  (length-iter items 0)
)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))