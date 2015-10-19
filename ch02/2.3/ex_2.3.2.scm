;感觉作者越玩越大了
;这也正是SICP牛逼的地方
;目测第四章以及第五章的内容还要丧心病狂
;但是我感觉我想多了

(define (variable? x)
  (symbol? x))

(define (same-variable? x y)
  (and (variable? x) (variable? y) (eq? x y)))

(define (make-sum a1 a2)
  (list '+ a1 a2))

;为了更好化简 还得优化处理下
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (list '* m1 m2))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))
      ))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define (defriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) 
          (if (same-variable? exp var) 1 0))
        ((sum? exp) 
          (make-sum (defriv (addend exp) var)
                    (defriv (augend exp) var)))
        ((product? exp)
          (make-sum (make-product (multiplier exp)
                                  (defriv (multiplicand exp) var))
                    (make-product (defriv (multiplier exp) var)
                                  (multiplicand exp))))
        (else
          (error "unknown expression type -- DEFRIV" exp))

      ))