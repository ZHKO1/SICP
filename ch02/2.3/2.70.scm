(load "2.69.scm")
(define sample-tree
  (generate-huffman-tree  '((A 2)
                           (BOOM 2)
                           (NA 16)
                           (SHA 3)
                           (GET 2)
                           (YIP 9)
                           (JOB 2)
                           (WAH 1))))

(length (encode '(get a job
                  sha na na na na na na na na na na
                  get a job
                  sha na na na na na na na na na na
                  wah yip yip yip yip yip yip yip yip yip
                  sha boom) sample-tree))

;88个

;如果是定长的话 我觉得就是每个单词三位
(* 3 (length '(get a job
              sha na na na na na na na na na na
              get a job
              sha na na na na na na na na na na
              wah yip yip yip yip yip yip yip yip yip
              sha boom)))
;120个