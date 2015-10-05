(load "SICP/ch02/2.2/2.17.scm")
(load "SICP/ch02/2.2/2.18.scm")
(define (deep-reverse items)
  (define items-length (length items))
  (define (reverse-items items items-number)
    (let ((item (list-ref items items-number)))
      (cond ((and (not (pair? item)) (= items-number 0)) (list item))
            ((and (pair? item) (= items-number 0)) (list (deep-reverse item)))
            ((and (not (pair? item)) (not (= items-number 0)))
              (cons item (reverse-items items (- items-number 1))))
            ((and (pair? item) (not (= items-number 0)))
              (cons (deep-reverse item) (reverse-items items (- items-number 1))))
          ))

  )
  (reverse-items items (- items-length 1))
)

(display (deep-reverse (list 19 (list 1 2 (list 7 4 5)) (list 3 4))))