import UIKit

var str = "拓展"
/*
 Swift 中的扩展可以：
 
 添加计算实例属性和计算类型属性；
 定义实例方法和类型方法；
 提供新初始化器；
 定义下标；
 定义和使用新内嵌类型；
 使现有的类型遵循某协议
 
 */

extension Double {
    var km: Double { return self * 1_000.0 }  // *1000  1_000只是写法
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"


// 初始化器
/*
 扩展可向已有的类型添加新的初始化器。这允许你扩展其他类型以使初始化器接收你的自定义类型作为形式参数，或提供该类型的原始视线中未包含的额外初始化选项。
 
 拓展能为类添加新的便捷初始化器，但是不能为类添加指定的初始化器或反初始化器。指定初始化器和反初始化器，必须由原来的类的实现提供。
 */

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()
let memberWiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

// 你可以扩展 Rect 结构体以额外提供一个接收特定原点和大小的初始化器：

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 2.0, y: 2.5), size: Size(width: 10.0, height: 10.0))

// 拓展可以为已有的类型添加新的实例方法和类型方法，下面的例子为 Int 类型添加了一个名为 repetitions的新实例方法。

extension Int{
    func repetions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetions {
    print("hello")
}


// 异变实例方法  增加了扩展的实例方法仍然可以修改（或异变）实例本身。结构体和枚举类型方法在修改 self 或本身的属性时必须标记实例方法为 mutating 和原本实现的异变方法一样。

extension Int {
    mutating func square(){
        self = self * self
    }
}
var someInt = 3
someInt.square()


// 下标 拓展能为已有的类型添加新的下标。🌰

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7


// 内嵌类型


extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "
