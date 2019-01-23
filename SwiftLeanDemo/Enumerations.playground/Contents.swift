import UIKit

var str = "枚举"

enum CompassPoint{
    case north // 小写
    case south
    case east
    case west
}

// 不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。在上文的 CompassPoint例子中， north， south， east和 west并不代表 0， 1， 2和 3。而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在 CompassPoint中被显式定义的类型。

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.north

// 当directiontoHead 类型被推断出来后 可以这么写
directionToHead = .west

// 用switch case 判断枚举类型

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}



// 当case 没有把所有条件列举时  需要加上default 不然编译报错
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}


// 遍历枚举情况 可以通过在枚举名字后面写 :CaseIterable 来允许枚举被遍历 Swift 会暴露一个包含对用枚举类型所有情况的集合名为allClass

enum Beverge: CaseIterable{
    case coffee, tea, juice
}
let numberOfChoice = Beverge.allCases.count
print(numberOfChoice)

for beverge in Beverge.allCases {
    print(beverge)
}

// 关联值

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."


// 另一种声名
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."


// 原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 隐式原始值

enum Planets: Int {  // Int类型 自增 1 2 3 4 。。。
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let plant1 = Planets.earth

print(plant1.rawValue)

enum CompassPoints: String { // 字符串类型 就是字符串
    case north, south, east, west
}

let sunsetDirection = CompassPoints.west.rawValue

// 从原始值初始化
let plant2 = Planets(rawValue: 2)



// 递归枚举
// 递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。

enum ArithmeticExpression1 {
    case number(Int)
    indirect case addition(ArithmeticExpression1, ArithmeticExpression1)
    indirect case multiplication(ArithmeticExpression1, ArithmeticExpression1)
}

// 整个枚举成员在需要时可以递归
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// Prints "18"
