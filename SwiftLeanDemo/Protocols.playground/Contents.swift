import UIKit

var str = "协议"

// 协议语法

// 声名
protocol FirstProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    
}

// 遵守协议 class也是这个写法
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

// 属性要求  属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。
protocol SomeProtocol{
    var mustBeSettable: Int {get set} // 可读可写
    var doesNotNeedToBeSettable: Int {get} // 只读
}

struct Person: SomeProtocol {
    var  mustBeSettable: Int
    var  doesNotNeedToBeSettable: Int
}

// 初始化
let john = Person(mustBeSettable: 2, doesNotNeedToBeSettable: 3)


//*********************方法要求*******************
/*
 协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。
 
 正如类型属性要求的那样，当协议中定义类型方法时，你总要在其之前添加 static 关键字。即使在类实现时，类型方法要求使用 class 或 static 作为关键字前缀，前面的规则仍然适用：

 */

protocol Some1Protocol {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}



class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"

// Tips

/*如果你在协议中标记实例方法需求为 mutating ，在为类实现该方法的时候不需要写 mutating 关键字。 mutating 关键字只在结构体和枚举类型中需要书写。
 
*/

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// 初始化器要求
/*
 协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体：
 
 */
protocol Some7Protocol {
    init(someParameter: Int)
}

// 协议初始化器要求的类实现
/*
 你可以通过实现指定初始化器或便捷初始化器来使遵循该协议的类满足协议的初始化器要求。在这两种情况下，你都必须使用 required 关键字修饰初始化器的实现：
 */

class Som0eClass: Some7Protocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

// 如果一个子类重写了父类指定的初始化器，并且遵循协议实现了初始化器要求，那么就要为这个初始化器的实现添加 required 和 override 两个修饰符：

protocol Some2Protocol {
    init()
}

class Some4SuperClass {
    init() {
        // initializer implementation goes here
    }
}

class Somes3SubClass: Some4SuperClass, Some2Protocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}


// 协议作为类型
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator  // 协议
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

