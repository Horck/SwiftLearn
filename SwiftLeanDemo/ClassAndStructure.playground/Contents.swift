import UIKit

var str = "类和结构体"

/*
 相同点
 
 定义属性用来存储值；
 定义方法用于提供功能；
 定义下标脚本用来允许使用下标语法访问值；
 定义初始化器用于初始化状态；
 可以被扩展来默认所没有的功能；
 遵循协议来针对特定类型提供标准功能。
 
 类独特的特点
 
 继承允许一个类继承另一个类的特征;
 类型转换允许你在运行检查和解释一个类实例的类型；
 反初始化器允许一个类实例释放任何其所被分配的资源；
 引用计数允许不止一个对类实例的引用。
 */

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var inerlaced = false
    var frameRate = 0.0
    var name: String?
}

// 实例
let someResolution = Resolution()
let someVideoMode  = VideoMode()

// 访问属性
print(someResolution.height)
print(someVideoMode.resolution.width)


// 结构体初始化
let otherResolution = Resolution(width: 1, height: 2)

// 结构体和枚举是值类型 值类型是一种当它被指定到常量或者变量 或者被传递给函数时会被拷贝的类型 Swift 中所有的基本类型——整数，浮点数，布尔量，字符串，数组和字典——都是值类型  Swift 中所有的结构体和枚举都是值类型，这意味着你所创建的任何结构体和枚举实例——和实例作为属性所包含的任意值类型——在代码传递中总是被拷贝的。

// 举个🌰

var another = otherResolution

another.width = 888

print("another.width = \(another.width)  other.width = \(otherResolution.width)")


// 类是引用类型 在引用类型被赋值到一个常量，变量或者本身被传递到一个函数的时候它是不会被拷贝的。相对于拷贝，这里使用的是同一个对现存实例的引用。

let tenEighty = VideoMode()
tenEighty.resolution = otherResolution
tenEighty.inerlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("tenEighty.frameRate = \(tenEighty.frameRate)  alsoTenEighty.frameRate = \(alsoTenEighty.frameRate)")


// 特征运算符
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// 注意”相同于”(用三个等于号表示，或者说 ===)这与”等于”的意义不同(用两个等于号表示，或者说 ==)。

// “相同于”意味着两个类类型常量或者变量引用自相同的实例；
// “等于”意味着两个实例的在值上被视作“相等”或者“等价”，某种意义上的“相等”，就如同类设计者定义的那样。



// 字符串、数组 字典的赋值与拷贝
/*
Swift 的 String、Array和Dictionary类型是作为结构体实现的 这意味着字符串 数组和字典它们被赋值到一个新的变量或者常量，亦或者它们本身被传递到一个函数或方法中时其实传递了拷贝
 
 
*/
