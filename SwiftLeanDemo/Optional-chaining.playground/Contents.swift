import UIKit

var str = "可选链"

// 可选链是一个调用和查询可选属性、方法和下标的过程，它可能为 nil 。如果可选项包含值，属性、方法或者下标的调用成功；如果可选项是 nil ，属性、方法或者下标的调用会返回 nil 。多个查询可以链接在一起，如果链中任何一个节点是 nil ，那么整个链就会得体地失败。



class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

// let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error  如果residence没有初始化 上面写法报错


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 这将会告诉 Swift 把可选 residence 属性“链接”起来并且取回 numberOfRooms 的值，如果 residence 存在的话。


