(load "SICP/ch01/1.3/ex_1.3.3.scm")

;更加简洁漂亮的解法
(define (cont-frac n d k)
  (define (iter i result)
    (let ((iterm (/ (n i) (+ (d i) result))))
         (if (= i 1)
            iterm
            (iter (- i 1) iterm))))
    (iter k 0))

;我原来的做法 没考虑到k的问题 改进了一下
(define (cont-frac n d k)
  (define (f i x)(/ (n i) (+ (d i) x)))
  (define (try result step)
    (if (< step 1)
      result
      (let  ((next (f step result)))
          (try next (- step 1)))))
  
  (try (/ (n k) (d k)) (- k 1)))

;题解的递归
(define (cont-frac n d k)
  (define (f i)
    (if(= i k)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (f (+ i 1)))))
    )
  (f 1)
  )
          
;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)
(define (golden-ratio k)
    (+ 1
       (cont-frac (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k)))
                  
;(golden-ratio 400)