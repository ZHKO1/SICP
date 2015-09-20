(load "SICP/ch01/1.3/ex_1.3.3.scm")
(define (deriv g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx))
                    (g x))
                 dx
              )))

;(define (cube x) (* x x x))

;验证导数函数
;((deriv cube) 5)

;牛顿法的搜寻函数 也就是逼近函数
;这里我要强调一下牛顿法和之前的不动点法的不同之处
;
;之前不动点法 其实大家都知道 也就是fixed-point-of-transform函数
;然而后面为了能更好收敛 所以就采用 average-damp 方法
;
;后面我们的牛顿就研究出了牛顿法
;因为我们发现如果g(x)是一个可微函数，那么g(x)=0 的一个解就是f(x)的不动点
;f(x)请参考newton-transform函数
;也就是说 如果我们要求一个函数的解 比如sqrt函数
;可以利用转化成g(x)函数的零点 来转化为f(x) ,再通过f(x)的不动点来解决问题就可以了
;


(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess 0.00001))
  
(define (sqrt x)
  (newton-method (lambda (y) (- (* y y) x)) 1.0))

;(sqrt 2)

;好了 到此 我们又要考虑抽象提炼的问题
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess 0.000001))


(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (sqrt1 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))
;(sqrt1 2)
(define (sqrt2 x)
  (fixed-point-of-transform (lambda (y) (- (* y y) x))
                            newton-transform
                            1.0))
;(sqrt2 2)

