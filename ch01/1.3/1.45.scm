(load "SICP/ch01/1.3/ex_1.3.3.scm")
(load "SICP/ch01/1.3/ex_1.3.4.scm")
(load "SICP/ch01/1.3/1.43.scm")

;刚开始看这题目的时候 完全看不懂耶
;真是个悲伤的故事

;base的n次方
(define (ext base n)
  (if (= n 0)
      1
      ((repeated (lambda (x) (* x base)) n) 1)))

;f(x)的平均阻尼

(define (average-damp-n-time f n)
  ((repeated average-damp n) f))

;x/y^(n-1)的damped-times次平均阻尼
(define (damped-nth-root n damp-times)
  (lambda (x) (fixed-point (
                            average-damp-n-time (
                              lambda (y) (/ x (ext y (- n 1)))) 
                            damp-times)
                            1.0
                            0.000001)))

(define (lg n)
    (cond ((> (/ n 2) 1)
            (+ 1 (lg (/ n 2))))
          ((< (/ n 2) 1)
            0)
          (else
            1)))

(define (nth-root n)
    (damped-nth-root n (lg n)))

(define 4th-root (nth-root 4))
(4th-root (* 3 3 3 3))
