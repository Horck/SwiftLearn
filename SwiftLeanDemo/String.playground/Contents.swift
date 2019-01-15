import UIKit

var str = "Hello, playground"

// 多行字符串
let threeDoubleQuotes = """
Escaping the first quote \"""
  Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)

// itm let item: Character
for item in str {
    print(item)
}

//***************************字符串字面量中的特殊字符******************

// \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
let wiseWords = "\"Imagenation is more import than knowledge\" - Einstein "
print(wiseWords)

let dollarSign = "\u{24}"


//***************************字符统计******************

let holloWords = "Hi i am Lin"
print("字符串count--->\(holloWords.count)\n")

//***************************访问修改字符串******************

let greeting =  "Guten Tag"

//G
greeting[greeting.startIndex]

//g
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

// 循环遍历字符串
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// 你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ， index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ， Dictionary 和 Set 。



