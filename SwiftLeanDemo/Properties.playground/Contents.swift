import UIKit

var str = "属性"

// 储存属性

struct FixedLengthRange {
    var firstValue: Int
    let length: Int  // 实例化不能修改
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8


let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
/*
 rangeOfFourItems.firstValue = 6  ⚠️  这是由于结构体是值类型。当一个值类型的实例被标记为常量时，该实例的其他属性也均为常量。
 

*/
// this will report an error, even though firstValue is a variable property

// 延迟储存属性 ⚠️ 你必须把延迟存储属性声明为变量（使用 var 关键字），因为它的初始值可能在实例初始化完成之前无法取得。常量属性则必须在初始化完成之前有值，因此不能声明为延迟。

class DataImporter {
    
    //DataImporter is a class to import data from an external file.
    //The class is assumed to take a non-trivial amount of time to initialize.
    
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()  // 当第一次访问这个属性时候才初始化
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let dss = DataManager()

// ⚠️ 如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次。 线程不安全

struct Point{
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        // 简写 setter  默认命名为newValue
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
        // 标准写法
        /*
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
         */
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// prints "square.origin is now at (10.0, 10.0)"


// 只读属性  ⚠️ 你必须用 var 关键字定义计算属性——包括只读计算属性——为变量属性，因为它们的值不是固定的。 let 关键字只用于常量属性，用于明确那些值一旦作为实例初始化就不能更改。


// 你可以通过去掉 get 关键字和他的大扩号来简化只读计算属性的声明：

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// 属性观察者
/*
 willSet 会在该值被存储之前被调用。
 didSet 会在一个新值被存储后被调用。
 */

class StepCounter {
    var totalSteps: Int = 0 {
        // 省略参数写法 默认 newValue  oldValue
        willSet{
            print("About to set totalSteps to \(newValue)")
        }
        didSet{
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }

        }
    }
    
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200



