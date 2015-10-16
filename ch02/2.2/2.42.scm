(load "SICP/ch02/2.2/ex_2.2.3.scm")



(define (adjoin-position row col rest-of-queens)
  (append rest-of-queens (list row))
)

(define (safe? k positions)
  (define (single-queen-safe? k new-queen x old-queen)
    (let ((a-row new-queen)
          (a-col k)
          (b-row old-queen)
          (b-col x))
      (and (not (= a-row b-row)) (not (= (abs (- a-row b-row)) (abs (- a-col b-col))))))
  )
  (if (<= k 1)
      #t
      (let ((new-queen (list-ref positions (- k 1))))
        (accumulate (lambda (x y) (and x y))
                    #t
                    (map (lambda (x) (single-queen-safe? k
                                             new-queen
                                             x
                                             (list-ref positions (- x 1))))
                         (enumerate-interval 1 (- k 1))))
        )))


(define (queens board-size)
  (define (queens-cols k)
    (if (= k 0)
        (list '())
        (filter (lambda (positions) (safe? k positions))
                (flatmap
                  (lambda (rest-of-queens)
                    (map (lambda (new-row)
                                 (adjoin-position new-row k rest-of-queens))
                         (enumerate-interval 1 board-size)))
                  (queens-cols (- k 1)))
             )
      ))
  (queens-cols board-size)
)

(define (print-chessboard items)
  (newline)
  (display (car items))
  (if (not (null? (cdr items)))
      (print-chessboard (cdr items)))
)

;最后测试语句
;(print-chessboard (queens 8))
