;题目的意思就是能不能（key1,key2,key3,,,keyn) : value来保存数据

(define (make-table)
  (let ((local-table (list '*table*)))

    ;在同一维度寻找key对应的表格
    (define (assoc key records)
      (cond ((null? records) false)
            ((not (pair? (car records))) (assoc key (cdr records)))
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))
          ))

    ;递归寻找的脏活
    (define (lookup-next-table key-list table)
      (newline)
      (display "key-list: ")
      (display key-list)
      
      (newline)
      (display "table: ")
      (display table)
      
      
      (let ((subtable (assoc (car key-list) table)))
        (if subtable
            (if (null? (cdr key-list))
                subtable
                (lookup-next-table (cdr key-list) subtable))
            #f)))

    ;按照维度序列来寻找
    (define (lookup . key)
      (let ((record (lookup-next-table key local-table)))
        (if record
            (cdr record)
            #f)))

    (define (insert!-found-next-table key-list value table)
      (let ((subtable (assoc (car key-list) table)))
        (if subtable
            (cond ((null? (cdr key-list)) (set-cdr! subtable value))
                  (else (insert!-found-next-table (cdr key-list) value subtable)))
            (set-cdr! table (cons (insert!-create-new-table key-list value)
                                  (cdr table))))))

    (define (insert!-create-new-table key-list value)
      (if (null? (cdr key-list))
          (cons (car key-list) value)
          (list (car key-list)
                (insert!-create-new-table (cdr key-list) value))))


    (define (insert! value . key)
      (insert!-found-next-table key value local-table))


    (define (printf)
      local-table)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            ((eq? m 'display) printf)
            (else (error "Unknown operation --table" m))
          ))
    dispatch))

(define A  (make-table))
((A 'insert-proc) 'wow    'a 'a1)
((A 'insert-proc) 'so     'a 'a2)
((A 'insert-proc) 'so     'a 'a3)
((A 'insert-proc) 'doge   'b 'b1)
((A 'insert-proc) 'yeach  'c 'c1 'c2)

((A 'display))
((A 'lookup-proc) 'a 'a2)
