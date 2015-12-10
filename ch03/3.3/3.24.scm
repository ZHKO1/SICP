(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))
          ))

    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (cdr record)
            false)))
    
    (define (insert! key value)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (set-cdr! record value)
            (set-cdr! local-table (cons (cons key value) (cdr local-table)))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            (else (error "Unknown operation --table" m))
          ))
    dispatch))


(define (same? a b)
  (<= (abs (- a b)) 0.1))
(define A  (make-table same?))
((A 'insert-proc) 1 'wow)
((A 'insert-proc) 2 'so)
((A 'insert-proc) 3 'doge)
((A 'lookup-proc) 1.01)