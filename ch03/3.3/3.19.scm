;这里我还是搞不定.....直接看解说吧
;http://community.schemewiki.org/?sicp-ex-3.19
;以下顺便带寻找环的入口在哪里
;http://keep.iteye.com/blog/293454

;这里就是链表的经典处理 一步 二步交叉处理
(define (contains-cycle? lst) 
   (define (safe-cdr l) 
     (if (pair? l) 
         (cdr l) 
         '())) 
   (define (iter a b)
     (newline) 
     (display (car a))
     (cond ((not (pair? a)) #f) 
           ((not (pair? b)) #f) 
           ((eq? a b) #t) 
           ((eq? a (safe-cdr b)) #t) 
           (else (iter (safe-cdr a) (safe-cdr (safe-cdr b)))))) 
   (iter (safe-cdr lst) (safe-cdr (safe-cdr lst)))) 

