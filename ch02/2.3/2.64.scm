(load "2.63.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (newline)
  (display elts)
  (display " ")
  (display n)
  
  (if (= n 0)
      (cons '() elts)
      ;获取 一半的规模数量
      (let ((left-size (quotient (- n 1) 2)))
        ;构建 构建好左边部分
        (let ((left-result (partial-tree elts left-size)))
          ;左边的树
          ;剩下的表
          ;右边的规模
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            ;这个树的节点
            ;right-result 构建好右边部分
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)))
              ;右边的树
              ;剩下来的问题
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))


;Θ(n)

