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

// 属性要求


