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

// 可变形式参数

