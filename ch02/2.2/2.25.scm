;1 (3 (5 7) 9)
;(7) nil
;1 (2 (3 (4 (5 (6 7)))))


;验证
(display (car (list 1 3 (list 5 7) 9)))
(display (cdr (list 1 3 (list 5 7) 9)))

(display (car (list (list 7))))
(display (cdr (list (list 7))))

(display (car (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))
(display (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))

;第三个 我算错了 应该是1 和 ((2 (3 (4 (5 (6 7))))))

;以上我看错题目了 我看成 car cdr 各自会有什么结果

(display
  (car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
)

(display 
  (car (car (list (list 7))))
)

(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))))))))))))))