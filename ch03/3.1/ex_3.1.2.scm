;这里开始要思考赋值有个什么作用以及带来的影响
;假设我们已经有了rand-update 这个函数
;这个函数可以通过一个随机参数来获得下一个随机参数
;x2 = (rand-update x1)
;x3 = (rand-update x2)

;这里我们可以考虑将rand实现下

(define random-init 1)

;只是假设罢了 随便搞搞
(define (rand-update x)
  (+ x 1))

(define rand
  (let ((x random-init))
    (lambda ()
        (set! x (rand-update x))
      x)))

;这里我完全没想到lambda函数还能这么用 (lambda (x) a b c)以最后一个参数返回最准

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))
        ))
  (iter trials 0))

;基本就是这样 总之就是有了赋值，rand就好处理得多了。
;在实战里完全可以不用苦逼的random-update x
;模块化的可能性up