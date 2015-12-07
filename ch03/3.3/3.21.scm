(load "ex_3.3.2.scm")
(define q1 (make-queue))

(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)

(define (prinf-queue queue)
  (front-ptr queue))

(prinf-queue q1)

;因为delete－queue!逻辑不够完赞