(load "SICP/ch02/2.1/2.2.scm")

;判断是否是垂直
(define (vertical?-segment seg1 seg2)
  (let ((x1 (x-point (start-segment seg1)))
        (y1 (y-point (start-segment seg1)))
        (x2 (x-point (start-segment seg2)))
        (y2 (y-point (start-segment seg2))))
    (= 0 (+ (* x1 x2) (* y1 y2)))))

;算出一个线段的长度
(define (length segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (sqrt (+ (square (- (x-point start) (x-point end)))
             (square (- (y-point start) (y-point end)))))))

;第一个构造方式
(define (make-rectangle length-segment width-segment)
  (if (vertical?-segment length-segment width-segment)
      (cons length-segment width-segment)
      (display "not rectangle"))
  )

;第二种构造方式
(define (make-rectangle point1 point2 point3)
  (let ((seg1 (make-segment point1 point2))
        (seg2 (make-segment point2 point3)))
    (if (vertical?-segment seg1 seg2)
        (cons seg1 seg2)
        (display "not rectangle"))))

(define (length-rectangle rectangle)
  (length (car rectangle)))

(define (width-rectangle rectangle)
  (length (cdr rectangle)))

(define (perimeter-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width  (width-rectangle rectangle)))
    (* 2 (+ length width))))

(define (acreage-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width  (width-rectangle rectangle)))
    (* length width)))

(define x1 (make-point 3 0))
(define y1 (make-point 0 0))
(define x2 (make-point 0 0))
(define y2 (make-point 0 4))

(define z1 (make-segment x1 y1))
(define z2 (make-segment x2 y2))

;(perimeter-rectangle (make-rectangle z1 z2))
;(acreage-rectangle (make-rectangle z1 z2))


(perimeter-rectangle (make-rectangle x1 y1 y2))
(acreage-rectangle (make-rectangle x1 y1 y2))
