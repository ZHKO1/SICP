(load "../../ch02/2.3/ex_2.3.3.scm")

(define (make-account balance . my-key)
  
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  
  (define (depost amount)
    (begin (set! balance (+ amount balance))
    balance))

  (define (add-new-key new-key)
    (begin (set! my-key (adjoin-set new-key my-key)) "success"))
  

  (define (show-message message)
    "incorrect passord")
  
  (define (dispatch key m)
    (if (element-of-set? key my-key)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'depost) depost)
              ((eq? m 'verify) add-new-key))
        show-message
        )
    )
  dispatch
)

(define acc (make-account 100 'key))
;eq?是判断两个参数是否指向同一个对象，如果是才返回#t；equal?则是判断两个对象是否具有相同的结构并且结构中的内容是否相同，它用eq?来比较结构中成员的数量；equal?多用来判断点对，列表，向量表，字符串等复合结构数据类型。
(define (make-joint origin-account origin-key new-key)
  (if (equal? ((origin-account origin-key 'verify) new-key) "success")
      origin-account
      (error "worry passord")))

(define acc1 (make-joint acc 'key 'newkey))

;acc 和acc1 虽然是公用一个账户的，但是我实在是没法做到根据账号不同使用不同密码
;比如acc可以用acc1的密码来登陆上账号

;以下是略屌的解法:
;上面我的思路是这样的 密码的判定还是得需要在make-account里
;然后我的解法就变得很麻烦.然而这解法就靠包装来解决这个问题了
(load "3.3.scm")

(define (make-joint  origin-acc origin-password another-password)
    (lambda (given-password mode)
        (if (eq? given-password another-password)
            (origin-acc origin-password mode)
            display-wrong-another-password-message)))
(define (display-wrong-another-password-message useless-arg)
    (display "Incorrect another password"))

(define acc (make-account 100 'key))
(define acc1 (make-joint acc 'key 'newkey))
(define acc1 (make-joint acc 'key 'newkey))