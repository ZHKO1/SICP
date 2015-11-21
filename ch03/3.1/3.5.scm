(load "ex_3.1.2.scm")
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
;去看答案才知道这函数特么只生成小数点 怪不得答案特么是3.000 不是3.14
;你特么在坑我

(define (random-in-range low high)
    (let ((range (- high low)))
        (+ low 
           (random (exact->inexact range)))))  ; 确保生成浮点随机数

(define (estimate-intergral)
  (let ((Px 5)
        (Py 7)
        (x1 2)
        (x2 8)
        (y1 4)
        (y2 10))
        (let ((R (- x1 Px))
              (X (random-in-range x1 x2))
              (Y (random-in-range y1 y2))
        )(<= (+ (square (- X Px)) (square (- Y Py)))
        (square R)))))

(exact->inexact (* 4 (monte-carlo 1000000 estimate-intergral)))

;....我跑歪了....我懒得也跑回来了
;就这样吧