;一维表格

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))
      ))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table (cons (cons key value) (cdr table)))))
  'ok
)

(define (make-table)
  (list '*table*))

;测试数据
;(define A  (make-table))
;(insert! 'a 'key A)

;二维表格 需要make-table assoc
(define (lookup_ key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (cdr record)
              false))
        false)))

(define (insert_! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (set-cdr! record value)
              (set-cdr! subtable
                          (cons (cons key-2 value)
                                (cdr subtable)))))
        (set-cdr! table (cons
                          (list key-1 (cons key-2 value))
                          (cdr table))))))

;测试数据
;(define A  (make-table))
;(insert_! 'a  'a1 'key  A)
;(insert_! 'a  'a2 'wow  A)
;(insert_! 'b  'b1 'so   A)
;(insert_! 'c  'c1 'doge A)
;(lookup_ 'a 'a1 A)

;创建局部表格
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                              (cons (cons key-2 value)
                                    (cdr subtable)))))
            (set-cdr! local-table (cons
                              (list key-1 (cons key-2 value))
                              (cdr local-table))))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            (else (error "Unknown operation --table" m))
          ))
    dispatch))

;(define A  (make-table))
;((A 'insert-proc) 'a 'a1 'wow)
;((A 'insert-proc) 'a 'a2 'so)
;((A 'insert-proc) 'b 'b1 'doge)
;((A 'lookup-proc) 'b 'b1)