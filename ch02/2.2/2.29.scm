(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;然后(d)小题想改成如下
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;所以让我想想
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))
;答案应该是改成对应以上就可以了



;测试数据
;先来个简单点的数据
(define x (make-mobile (make-branch 20 40) (make-branch 40 20)))
(define y (make-mobile (make-branch 40 20) (make-branch 10 80)))
(define z (make-mobile (make-branch 5 x)   (make-branch 3 y)))



;判断是否是最简单的mobile
(define (is_single_mobile mobile)
  (and (not (pair? (branch-structure (left-branch mobile))))
       (not (pair? (branch-structure (right-branch mobile)))))
)

(define (total-weight mobile)
  (let ((left-str  (branch-structure (left-branch mobile)))
        (right-str (branch-structure (right-branch mobile))))
    ;当mobi的left和right的branch-structure都是重量
    ;当mobi的left是mobi right不是
    ;当mobi的left不是 right是
    (cond ((is_single_mobile mobile)
            (+ left-str right-str))
          ((and (pair? left-str) (not (pair? right-str)))
            (+ (total-weight left-str) right-str))
          ((and (pair? right-str) (not (pair? left-str)))
            (+ (total-weight right-str) left-str))
          (else (+ (total-weight right-str) (total-weight left-str)))
      )))

;判断mobile是否平衡
(define (is_balanced mobile)
  (let ((weight1 (branch-structure (left-branch mobile)))
        (length1 (branch-length    (left-branch mobile)))
        (weight2 (branch-structure (right-branch mobile)))
        (length2 (branch-length    (right-branch mobile)))
      )

  (cond ((is_single_mobile mobile)
          (= (* weight1 length1) (* weight2 length2)))
        ((and (pair? weight1) (not (pair? weight2)))
          (= (* (total-weight weight1) length1) (* length2 weight2)))
        ((and (pair? weight2) (not (pair? weight1)))
          (= (* (total-weight weight2) length2) (* length1 weight1)))
        (else (= (* (total-weight weight2) length2) (* length1 (total-weight weight1))))
    )))

(define (is_all_balanced mobile)
  (let ((left-str  (branch-structure (left-branch mobile)))
        (right-str (branch-structure (left-branch mobile))))
    ;当mobi的left和right的branch-structure都是重量
    ;当mobi的left是mobi right不是
    ;当mobi的left不是 right是
    (cond ((is_single_mobile mobile)
            (is_balanced mobile))
          ((and (pair? left-str) (not (pair? right-str)))
            (is_all_balanced left-str))
          ((and (pair? right-str) (not (pair? left-str)))
            (is_all_balanced right-str))
          (else (and (is_all_balanced left-str)
                     (is_all_balanced right-str)
                     (is_balanced mobile)))
      ))
)


