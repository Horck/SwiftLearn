import UIKit

var str = "闭包"

// 什么是闭包
// 包是可以在你的代码中被传递和引用的功能性独立模块。Swift 中的闭包和 C  以及 Objective-C 中的 blocks 很像，还有其他语言中的匿名函数也类似
/*
 闭包表达式语法有如下的一般形式：
{ (parameters) -> (return type) in
    statements
}
*/


let names = ["Chris","Alex","Ewa","Barry","Daniella"]

let reversedNames1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames1)

// 从单表达式隐式返回
let reverseNames2 = names.sorted(by:{s1, s2 in s1 > s2})

print(reverseNames2)

// 简写实际参数名 Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。


let reverseNames3 = names.sorted(by: { $0 > $1 })

print(reverseNames3)

// 运算符函数
// 实际上还有一种更简短的方式来撰写上述闭包表达式。Swift 的 String 类型定义了关于大于号（ >）的特定字符串实现，让其作为一个有两个 String 类型形式参数的函数并返回一个 Bool 类型的值。这正好与  sorted(by:) 方法的第二个形式参数需要的函数相匹配。因此，你能简单地传递一个大于号，并且 Swift 将推断你想使用大于号特殊字符串函数实现：


let reverseNames4 = names.sorted(by: >)

print(reverseNames4)

// 尾随闭包

func someFunctionThatTakesAClosure(closure:() -> Void){
    //function body goes here
}

// 如果闭包表达式被用作函数唯一的实际参数并且你把闭包表达式用作尾随闭包，那么调用这个函数的时候你就不需要在函数的名字后面写一对圆括号 ( )。

someFunctionThatTakesAClosure {
    
};

// 逃逸闭包   当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。



// 自动闭包

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) } // 这里只是延迟调用
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
