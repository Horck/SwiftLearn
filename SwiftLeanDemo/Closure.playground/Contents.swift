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


let reverseNames3 = names.sorted(by:{s1, s2 in s1 > s2})

print(reverseNames3)
