把框架看作局部状态的展台

这里以make-withdraw为例
这里是过程定义
按照3.2.1的定义来看
主要有两个部分 分别是代码部分 和指向环境
这两个部分 都很正常，和之前我们的理解也没什么区别
但是这里我们要注意： make-withdraw玩了二重lambda这招

所以问题就在这里
(define W1 (make-withdraw 100))
本来按照之前常见没技术含量的一重lambda过程定义 W1这时候应该是被返回(make-withdraw 100)的值而已
但是(make-withdraw 100)不是返回数值，而是还是返回过程.这个就耐人寻味了。
我们需要理理思路 重新认真看一遍
(define W1 (lambda (x) (* x x))) 和 (define W1 (make-withdraw 100))的最大区别是什么?

>>请参考3.2.1对 过程 和 过程被应用 定义
square 定义的是一个单纯的过程
1. x参数 (* x x)
2. 产生这个过程的环境

(make-withdraw 100)产生的是一个过程被应用的一个新环境E1
1. 参数约束 100 的框架
2. 外围环境是全局

所以(define W1 (make-withdraw 100))中
W1被赋予的是一个过程体
但是W1过程的诞生环境是在
但是W1的外围环境是E1 操作依旧需要在其环境中操作

(W1 50)的过程是W1