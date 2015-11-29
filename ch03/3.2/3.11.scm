全局 make-account过程体
====================================================
(define acc (make-account 100))
全局
make-account  过程体 正体:正体 指针:全局环境
acc           过程体 正体:dispatch 指针 E1

(make-account 100)
E1
指针 全局
balance:100
withdraw  过程体
deposit   过程体
dispatch  过程体
dispatch


====================================================
((acc 'deposit) 40)

全局
make-account  过程体 正体:正体 指针:全局环境
acc           过程体 正体:dispatch 指针 E1

(make-account 100)
E1
指针 全局
balance:100
withdraw  过程体
deposit   过程体
dispatch  过程体

(acc 'deposit)
E2
指针 E1
m : 'deposit 

((acc 'deposit) 40)
E3
指针 E1
amount : 40

