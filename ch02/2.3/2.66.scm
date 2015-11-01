(load "2.64.scm")
(define (make-node key value)
  (cons key value))

(define (getKey node)
  (car node))

(define (getValue node)
  (cdr node))

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define test-records
  (list->tree (list (make-node 1 "WOW")
                  (make-node 2 "SO")
                  (make-node 3 "DOGE")
                  (make-node 4 "YEACH")
                  (make-node 5 "YA-HA!"))))


(define (lookup give-key set-of-records)
  (let ((current (entry set-of-records))
        (left (left-branch set-of-records))
        (right (right-branch set-of-records)))
    (cond ((null? set-of-records) false)
          ((equal? give-key (getKey current)) (getValue current))
          ((> give-key (getKey current)) (lookup give-key right))
          ((< give-key (getKey current)) (lookup give-key left))
        )))

;(lookup 2 test-records)