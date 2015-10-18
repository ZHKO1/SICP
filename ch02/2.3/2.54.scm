(define (equal? items1 items2)
  (newline)
  (display "items1 ")
  (display items1)
  
  (newline)
  (display "items2 ")
  (display items2 )
  
  (cond ((and (not (pair? items1)) (not (pair? items2))) (eq? items1 items2))
         ((and (not (pair? items1)) (pair? items2)) #f)
         ((and (not (pair? items2)) (pair? items1)) #f)
         ((and (pair? items1) (pair? items2)) (and (equal? (car items1) (car items2)) (equal? (cdr items1) (cdr items2))))         
       ))
