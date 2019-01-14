
import UIKit

var str = "基本信息"

// **********************  常量变量 声名 **********************


let maxCount = 10 // 常量修改报错 maxCount = 100

var name1 = "李明", name2 = "珍妮" // 多变量声名

name1 + name2



// ********************** 类型标注 **********************

// 指定变量类型 welcomeMessage = 1 报错
var welcomeMessage: String = "嗨"

// 多类型变量声名
//var message1, message2, message3: String = "sss"
//message1 = "你好啊"
//message2 = "hello"
//message3 = "hi"
//print(message1)


// ********************** 打印 **********************

// 一行写多个代码的话 需要使用分号
print(welcomeMessage); print(welcomeMessage,"你好","啊",  separator:"/", terminator: "$\n")
// separator 中间插值  terminator 结尾值

// 类型转换   类型（）
let tree = 3

let pointNumber = 0.14159

let pi = Double(tree) + pointNumber


// ********************** 类型别名 **********************


typealias AudioSample = UInt16

var maxAmp = AudioSample.min


// ********************** 元组 **********************

// 元组 元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。
let http404Error = (404,"Error")

// 元组取值
let (status, statusMeesage) = http404Error;

print(status, statusMeesage)

// 不需要取值是用”_“替代即可
let (_, message) = http404Error

print("message is \(message)")

// 下标读取
print("message is \(http404Error.1)")

// 设置元组名字 取值直接用名字
let http200Status = (statusCoe: 200, description:"OK")

print("statusCode is \(http200Status.statusCoe)")


// ********************** 可选项 **********************

let possibleNumber = "123"

let convertedNumber = Int(possibleNumber) // 类型 let convertedNumber: Int? 问号明确了它储存的值是一个可选项，意思就是说它可能包含某些 Int  值，或者可能根本不包含值。

var severResponseCode: Int? = 400

print("severPesponseCode is \(String(describing: severResponseCode))")

print("severPesponseCode is \(severResponseCode!)")// 解包



// ********************** if 语句 **********************

// 多个条件判断 用’,‘分开 一个为假的则为 false
if let firstNumber: Int = 34 , let secondNumber = Int("200"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber) 是真的")
}


// ********************** 错误处理 **********************

/*
func makeASandwich() throws {
    print("造失败了")
}

do {
    try makeASandwich()
    print("造好了")
}catch Error.OutOfCleanDishes {

}
 */

// ********************** 断言和先决条件 **********************

let age = 3

// 根据条件断言
assert(age>=0, "年龄得大于0")


if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    // 直接断言❌
    assertionFailure("A person's age can't be less than zero.")
}

// 强制先决条件
precondition(age>2, "年龄错误")
