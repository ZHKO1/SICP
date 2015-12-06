(load "3.13.scm")
(define (boolean-cycle? x)
  (let ((temp (cdr x)))
    (begin (set-cdr! x '()) (eq? (car x) (car (last-pair temp))))))

;我还是想得太简单了 不是这个是不是环，而是这个是否是包含环？
;也就是说如果是

(define test-cycle (make-cycle (list 'a 'b 'c)))
(define test1 (list 'd 'e))

(set-cdr! (last-pair test1) test-cycle)
;这样的话 我的解法就隔屁掉了，更加严重的是还有一种办法也能让我的解法隔屁掉,如下

(define test2 (list 'd 'e 'd))
;防不胜防啊，我完全没法处理啊混蛋

;只能参考
;http://community.schemewiki.org/?sicp-ex-3.18
;我感觉题解的哥们有点丧心病狂了点，都特么考虑到一个环在一个元素里

(define t1 (list 'a 'b)) 
(define t2 (list t1 t1)) 

 (define (cycle? x) 
   (define visited '()) 
   (define (iter x) 
     (newline)
     (display (car x))
     (set! visited (cons x visited)) 
     (cond ((null? (cdr x)) #f) 
           ((memq (cdr x) visited) #t) 
           (else (iter (cdr x))))) 
   (iter x)) 

 (define (inf_loop? L) 
   (define (iter items trav)
     (newline)
     (display trav) 
     (cond ((not (pair? items)) #f)
           ;不是结构 OVER 
           ((eq? (cdr items) items) #t) 
           ;只有一个点的圆环 OVER
           ((eq? (car items) (cdr items)) 
           ;算法优化 OVER
            (iter (cdr items) trav)) 
           ((memq (car items) trav) #t) 
           ((memq (cdr items) trav) #t) 
           (else  
            (if (not (pair? (car items))) 
                (iter (cdr items) (cons items trav)) 
                (or (iter (car items) (cons items trav)) 
                    (iter (cdr items) (cons items trav))))))) 
   (iter L '()))