;(load "SICP/ch02/ex_2.2.1.scm")
(define (last-pair items)
  (let ((items-length (length items)) )
    (list-ref items (- items-length 1)))
  )
