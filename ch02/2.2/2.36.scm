(load "SICP/ch02/2.2/ex_2.2.3.scm")

(define (accumulate-n op init segs)
  (if (null? (car segs))
      '()
      (cons (accumulate   op init (map (lambda (x) (car x)) segs))
            (accumulate-n op init (map (lambda (x) (cdr x)) segs)))))