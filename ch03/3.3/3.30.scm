(load "ex_3.3.4.scm")

(define (ripple-carry-adder list_A list_B list_S C)
  (define (carry c-in list_A list_B list_S)
    (if (and (null? list_A) (null? list_B) (null? list_S))
        (add-action! c-in (lambda (x)
                                  (set-signal! C (get-signal c-in))))
        (let ((a (car list_A))
              (b (car list_B))
              (s (car list_S))
              (c-out (make-wire))
            )
          (full-adder a b c-in s c-out)
          (carry c-out (cdr list_A) (cdr list_B) (cdr list_S))
        )
    ))
  (define c-in (make-wire))
  (set-signal! c-in 0)
  (carry c-in list_A list_B list_S))


;(n * ((2 * ((max (or) (and + inverter)) + and)) + or))
;有待验证