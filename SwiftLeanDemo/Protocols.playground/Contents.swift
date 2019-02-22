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

var diceOne = Dice(sides: 2, generator: LinearCongruentialGenerator())  // LinearCongruentialGenerator 为遵守RandomNumberGenerator协议的实例 要求是实现这个协议的
diceOne.generator.random()

for _ in 1...5 {
    print("Random dice roll is \(diceOne.roll())")
}


/**************************委托*****************************/
/*
 委托[1]是一个允许类或者结构体放手（或者说委托）它们自身的某些责任给另外类型实例的设计模式。这个设计模式通过定义一个封装了委托责任的协议来实现，比如遵循了协议的类型（所谓的委托）来保证提供被委托的功能。委托可以用来响应一个特定的行为，或者从外部资源取回数据而不需要了解资源具体的类型。
 */
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()



// 在扩展里添加协议遵循


protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
var diceTwo = Dice(sides: 2, generator: LinearCongruentialGenerator())

diceTwo.textualDescription


//有条件地遵循协议
/*
 泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的泛型形式参数遵循对应协议时。你可以通过在扩展类型时列出限制让泛型类型有条件地遵循某协议。在你采纳协议的名字后面写泛型 where 分句。更多关于泛型 where 分句
 */


// 使用扩展声明采纳协议

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let ham = Hamster(name:"aaa")

ham.textualDescription

// 协议继承
/*
 协议可以继承一个或者多个其他协议并且可以在它继承的基础之上添加更多要求。协议继承的语法与类继承的语法相似，只不过可以选择列出多个继承的协议，使用逗号分隔：
 */

// 类专用的协议

protocol ClassUseProtlcol: AnyObject
{
    var nameSting: String? {get set}
}

class sss :ClassUseProtlcol {
    var nameSting: String?
    
    
}

var ssa = sss()
ssa.nameSting = "sss"

/*
struct someStuct: ClassUseProtlcol {  这样写编译报错
    
    var nameSting: String? {get set}

}
*/


// 协议组合

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Persons: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Persons(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)
