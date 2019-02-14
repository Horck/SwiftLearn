import UIKit

var str = "自动引用计数"

// 循环引用问题  解决循环强引用问题，可以通过定义类之间的关系为弱引用( weak )或无主引用( unowned )来代替强引用。


class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let units:String
    init(unit: String) {
        self.units = unit
    }
    // 用weak修饰后循环引用解除
    weak var tenant: Person?
    deinit {
        print("Apartment\(units) is being deinitialized")
    }
}


var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

// playground不打印deinit 放在项目里面可以
unit4A = nil
john = nil

// 闭包的循环引用

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

