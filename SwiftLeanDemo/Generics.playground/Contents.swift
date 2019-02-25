import UIKit

var str = "泛型"

// 定义
/*
 泛型是 Swift 最强大的特性之一，很多 Swift 标准库是基于泛型代码构建的。实际上，甚至你都没有意识到在语言指南中一直在使用泛型。例如，Swift 的 Array 和 Dictionary 类型都是泛型集合。你可以创建一个容纳 Int 值的数组，或者容纳 String 值的数组，甚至容纳任何 Swift 可以创建的其他类型的数组。同样，你可以创建一个存储任何指定类型值的字典，而且类型没有限制。
 */


// 交换值的函数

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 如果换为 String的话 还需要重新声名，所以要用到泛型函数

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/*
 泛型版本的函数用了一个占位符类型名（这里叫做 T ），而不是一个实际的类型名（比如 Int 、 String 或 Double ）。占位符类型名没有声明 T 必须是什么样的，但是它确实说了 a 和 b 必须都是同一个类型 T ，或者说都是 T 所表示的类型。替代 T 实际使用的类型将在每次调用 swapTwoValues(_:_:) 函数时决定。
 */

// 在下面的两个例子中， T 分别被推断为 Int 和 String ：

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"

// 泛型命名
/*
 大多数情况下，类型形式参数的名字要有描述性，比如 Dictionary<Key, Value> 中的 Key  和 Value ，借此告知读者类型形式参数和泛型类型、泛型用到的函数之间的关系。但是，他们之间的关系没有意义时，一般按惯例用单个字母命名，比如 T 、 U 、 V ，比如上面的 swapTwoValues(_:_:) 函数中的 T 。

 */


struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
}

}

// 泛型 结构体
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
