(define (make-deque)
  (let ((front-deque '())
        (rear-deque  '()))

    (define (empty-deque?)
      (null? front-deque))
  
    (define (printf)
      (define (printf-deque deque)
        (if (null? deque)
            '()
            (cons (car deque) (printf-deque (get-next deque)))))
      (printf-deque front-deque))

    (define (get-pre queque)
      (car (cdr queque)))

    (define (get-next queque)
      (cadr (cdr queque)))

    (define (front-insert-deque number)
      (let ((new-pair (cons number (list '() '()))))
        ;信息 前一个 后一个
        (cond ((empty-deque?)
                (set! front-deque new-pair)
                (set! rear-deque new-pair)
                (printf)
              )
              (else
                (set-car! (cddr new-pair) front-deque)
                (set-car! (cdr front-deque) new-pair)
                (begin (set! front-deque new-pair) (newline))
                (printf)
              ))))
    
    (define (front-delete-deque)
      (if (empty-deque?)
          (error "Can't be deleted.It is an empty-deque")
          (let ((front-next-queue (get-next front-deque)))
            (if (null? front-next-queue)
                (begin 
                 (set! front-deque '())
                 (set! rear-deque '())
                 (printf))
                (begin
                 (set-car! (cdr front-next-queue) '())
                 (set! front-deque front-next-queue)
                 (printf)))
          )))

    (define (rear-insert-deque number)
      (let ((new-pair (cons number (list '() '()))))
        (cond ((empty-deque?)
                (set! front-deque new-pair)
                (set! rear-deque new-pair)
                (printf)
              )
              (else
                (set-car! (cdr new-pair) rear-deque)
                (set-car! (cddr rear-deque) new-pair)
                (begin (set! rear-deque new-pair) (newline))
                (printf)
              ))))
    
    (define (rear-delete-deque)
      (if (empty-deque?)
        (error "Can't be deleted.It is an empty-deque")
        (let ((rear-pre-queue (get-pre rear-deque)))
          (if (null? rear-pre-queue)
              (begin 
               (set! front-deque '())
               (set! rear-deque '())
               (printf))
              (begin
               (set-car! (cddr rear-pre-queue) '())
               (set! rear-deque rear-pre-queue)
               (printf)))
        )))
    
    (define (dispatch m)
            (cond ((eq? m 'F_insert) front-insert-deque)
                  ((eq? m 'F_delete) front-delete-deque)
                  ((eq? m 'R_insert) rear-insert-deque)
                  ((eq? m 'R_delete) rear-delete-deque)
                  ((eq? m 'printf) printf)
                ))
  
    dispatch))

(define apple (make-deque))

;书上有注释让我不要打印包含环的结构.....
;我不明白书里特么在说什么鬼
;后来一看出错了 还真特么有环