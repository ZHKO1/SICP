(load "2.67.scm")
(load "ex_2.3.4.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (define (successive-merge-two pairs result)
    ;(newline)
    ;(display pairs)
    ;(newline)
    ;(display result)
    (if (< (length pairs) 2)
        (car pairs)
        (let ((first  (car pairs))
              (second (cadr pairs))
              (rest   (cddr pairs)))
          (successive-merge-two (adjoin-set (make-code-tree first second)
                                            rest)
                                (make-code-tree first second)))))
  (successive-merge-two pairs '())
  )

;以下数据测试专用
;(define a-leaf (make-leaf 'a 2))
;(define b-leaf (make-leaf 'b 3))
;(generate-huffman-tree '((A 4) (B 2) (D 1) (C 1)))