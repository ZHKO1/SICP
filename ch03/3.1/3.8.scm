(define f
  (let ((status 1)
        (step 1))
    (lambda (number)
      (cond ((and (= step 1) (= number 1))
             (begin (set! status number) (set! step 2) 1))
            ((and (= step 1) (= number 0))
             (begin (set! status number) (set! step 2) 0))
            ((and (= step 2) (= number 1) (not (= status number)))
             (begin (set! step 1) 0))
            ((and (= step 2) (= number 0) (not (= status number)))
             (begin (set! step 1) 0))
            (else (error "SHIT!"))
          ))))

(+ (f 0) (f 1))

;这里我发觉主要答案都有个问题 运行多遍就不行了 答案就成了2或者其他
;我这个版本 随便你换着顺序大力艹 都没事情