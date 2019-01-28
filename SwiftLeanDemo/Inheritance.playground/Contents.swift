import UIKit

var str = "继承"


class Vehicle {
    // 保证不被重写
    final var wheels = 4
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("Vehicle don't make noise")
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")


// 子类
class Bicycle: Vehicle {
    var hasBasket = false
    
    // 重写 需要加关键字 verride
    override func makeNoise() {
        // 调用父类方法
        super.makeNoise()
        print(" Bicycle Ding Ding Ding~ ")
    }
    // 重写属性
    override var description: String{
        return "Bike Can Go "
    }
    // 重写观察属性
    override var currentSpeed: Double
        {
        didSet{
            hasBasket = true
        }
    }
    
    // var wheels = 3  重写报错  
    
}

let bike = Bicycle()
bike.currentSpeed = 1.8


bike.makeNoise()
// 调用 父类方法

print(bike.description)



