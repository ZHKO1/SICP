(define z
  (let ((list_ '()))
    (define (push x)
      (begin (set! list_ (cons x list_)) list_))
    (define (contain? x)
      (define (contain-loop? list_one)
        (cond ((null? list_one) #f)
              ((eq? x (car list_one)) #t)
              (else (contain-loop? (cdr list_one)))
            ))
      (contain-loop? list_)
    )
    (define (show-list) list_)
    (define (dispatch p)
      (cond ((eq? p 'push) push)
            ((eq? p 'show-list) show-list)
            ((eq? p 'contain?) contain?)))
    dispatch
  ))

(define (count-pairs x)
  ;(zh_log x)
  ;(zh_log ((z 'show-list)))
  (if (pair? x)
      (if ((z 'contain?) x)
          0
          (begin  ((z 'push) x)
                  (+  (count-pairs (car x))
                      (count-pairs (cdr x))
                      1)))
      0))

;其实还需要考虑圆环情况 但是我懒的搞了
(define (count-pairs x)
    (length (inner x '())))

(define (inner x memo-list)
    (if (and (pair? x)
             (false? (memq x memo-list)))
        (inner (car x)
               (inner (cdr x)
                      (cons x memo-list)))
        memo-list))
;这哥们的解法还要优雅 没错 更加巧妙 直接跳出框架思考，不受局限
;当然还是和我一样 碰到圆环就隔屁了