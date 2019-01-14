import UIKit

var str = "运算符"

// **********************合并空值运算符****************

let a: Int? = nil
let b = 4

let c = a ?? b // 对a解包  a 必须为可选值类型 b必须为与a相同类型的值 等价于  a != nil ? a! : b
print(c)

// **********************区间运算符****************

for index in 1...5 {
    print("闭区间运算符 --> \(index)" )
}


let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<names.count {
    print("半开区间运算符--->\(i) name -->\(names[i])")
}


for name in names[...2] { // <=2
    print("单侧区间 --->\(name)")
}

for name in names[2...] { // >=2
    print("单侧区间 --->\(name)")
}

for name in names[..<2] { // <2
    print("半开单侧区间 --->\(name)")
}

let range = ...5
range.contains(3)
range.contains(8)
