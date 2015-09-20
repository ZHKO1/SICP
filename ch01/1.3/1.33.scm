(define (filtered-accumulated combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (let ((rest-terms (filtered-accumulated  combiner
                                              null-value
                                              term
                                              (next a)
                                              next
                                              b
                                              filter?)))
        ((if (filter? a)
            (combiner (term a) rest-terms)
            (rest-terms))))))

