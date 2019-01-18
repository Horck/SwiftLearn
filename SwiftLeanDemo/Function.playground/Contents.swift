import UIKit


var str = "函数"

func greet(person: String) ->String{
    
    let greet = "Hello " + person + "!"
    
    return greet;
}

greet(person: "Joy")


// 多返回值
func sayHello(array:[String]) ->(firstWords:String, lastWords:String)
{
    return(array.first!,array.last!);
}

let namesArry = sayHello(array: ["LIly","jemy","Jack"]);

// 值绑定方式取值
print("第一个名字\(namesArry.firstWords) \n最后一个名字\(namesArry.lastWords)")

// 可选元组返回类型 当值为空时直接返回空 避免直接取值报错
func minMax(array: [Int]) ->(min: Int, max: Int)?
{
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

minMax(array:[1,3,2])

// 函数实参和形参 省略形参用 _  直接传值
func add(_ number1:Int,number2:Int)
{
    let result = number1 + number2
    
    print(result)
}

add(1,number2: 2)

// 指定参数默认值
func someFunction(parameterWithDefault: Int = 11)
{
    print(parameterWithDefault)
    
}
someFunction()

someFunction(parameterWithDefault: 22);

// 可变形式参数  。。。 代表多个参数
func arithmeticMean(_ numbers:Double...) ->Double
{
    var total: Double = 0;
    for number in numbers {
        total+=number;
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,3,5,7,9)

// 输入输出形式参数
// 替换k两个数的值 输入输出形式参数不能有默认值，可变形式参数不能标记为 inout，如果你给一个形式参数标记了 inout，那么它们也不能标记 var和 let了。
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3"


// 使用函数类型

func addTwoInts(_ numA:Int, _ numB:Int) ->Int
{
    return numA+numB
}
var matchFunctions: (Int, Int) -> Int = addTwoInts

// “定义一个叫做 mathFunction的变量，它的类型是‘一个能接受两个 Int值的函数，并返回一个 Int值。’将这个新的变量指向 addTwoInts函数。”

// 函数类型作为形式参数类型

/// 计算函数结果
///
/// - Parameters:
///   - mathFunction: 计算方法
///   - a: a值
///   - b: b 值
func printMathResult(_ mathFunction:(Int, Int) ->Int, _ a: Int, _ b: Int)
{
    print(mathFunction(a,b))
}

printMathResult(matchFunctions, 3, 8)
// 函数 printMathResult(_:_:_:)的作用就是当调用一个相应类型的数学函数的时候打印出结果。它并不关心函数在实现过程中究竟做了些什么，它只关心函数是不是正确的类型。这使得函数 printMathResult(_:_:_:)以一种类型安全的方式把自身的功能传递给调用者。


// 函数类型作为返回值

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int{
    return backwards ? stepForward : stepBackward
}

var currentValue = 3

let moveNearToZero = chooseStepFunction(backwards: currentValue > 3)

moveNearToZero(2);

// 内嵌函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction(backward: currentValue1 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue1 != 0 {
    print("\(currentValue)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!


