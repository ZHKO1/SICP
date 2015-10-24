;这回我承认我怕了 真的怕了
;一看就很麻烦的样子

(load "ex_2.3.2.scm")

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))
      ))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s)
  (car s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p)
  (car p))

;a小题意外的好处理.....但是我知道后面还有更难的在等着我
;接下来就是b小题了
;我觉得比较重要的思路就是如何判定(x * 3 + x)为sum而不是product
;问题又来了 我怎么判断出addend? 或者 augend?
;然后再一一测试函数是否靠谱就可以了

(define (find item items)
  (define (findnext items number)
    (cond ((null? items) -1)
          ((equal? (car items) item) number)
          (else (findnext (cdr items) (+ number 1)))
        ))
  (findnext items 0))

(define (splice items start end)
  (define (splice-items items number)
    (cond ((= start end) (list-ref items start))
          ((< number start) (splice-items (cdr items) (+ number 1)))
          ((and (>= number start) (< number end))
            (cons (car items) (splice-items (cdr items) (+ number 1))))
          ((= end number) (cons (car items) '()))
          
        ))
  (splice-items items 0)
  )

(define (sum? x)
  (and (pair? x) (>= (find '+ x) 0)))

(define (product? x)
  (and (pair? x) (not (sum? x)) (>= (find '* x) 0)))

(define (addend s)
  (splice s 0 (- (find '+ s) 1)))

(define (augend s)
  (splice s (+ (find '+ s) 1) (- (length s) 1)))

(define (multiplier p)
  (car p))

(define (multiplicand p)
  (let ((item (cddr p)))
    (if (> (length item) 1)
        item
        (caddr p))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (append (list a1 '+) a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        ((product? m2) (append (list m1 '*) m2))
        (else (list m1 '* m2))
      ))