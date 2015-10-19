(load "ex_2.3.2.scm")

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (exponentiation? x base_of_x)
  (and (pair? x) (eq? (base x) base_of_x) (eq? (car x) 'base)))

(define (make-exponentiation e1 e2)
  (cond ((=number? e2 0) 1)
        ((=number? e2 1) e1)
        ((and (number? e1) (numebr? e2)) (base e1 e2))
        (else (list 'base e1 e2))
      ))

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
        ((exponentiation? exp var)
          (make-product (exponent exp)
                        (make-exponentiation (base exp) (- (exponent exp) 1))))
        (else
          (error "unknown expression type -- DEFRIV" exp))

      ))

;测试
;(defriv '(+ (* x y) (base x 3)) 'x)

;(defriv '(base x 3) 'x)
