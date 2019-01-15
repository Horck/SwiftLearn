import UIKit

var str = "Hello, playground"

//**************************数组******************************

var someInts = [Int]()

someInts.append(2)
someInts.append(3)
someInts.remove(at:0) // 下标
print(someInts)

// someInts = []// 置空 但是类型依然是  var someInts: [Int]

var repeatArray = Array(repeating:"重要的事情说三遍", count: 3)
print(repeatArray)

var combineArray = someInts + Array(repeating: 5, count: 3) // 数组合并前提类型一致

print(combineArray)



// 数组修改

if someInts.isEmpty {
    print("这个数组是空的")
}

// 添加
someInts.append(33)
print(someInts)
someInts += [55] //运算符运算 只能是同种类型
print(someInts)

// 取值
someInts[0]

someInts[1...2]

// 遍历
for index in someInts {
    print(index)
}

// enumerated 返回下标和值
for (index,value) in someInts.enumerated() {
    print("下标是--\(index) \n value---\(value)")
}



//**************************集合******************************

var letters = Set<Character>() // 初始化 集合是无须的

letters.insert("a")
letters.insert("b")
letters.insert("c")
letters.insert("d")

print(letters)

// 遍历
for item in letters.sorted() { // 排序后遍历
    print(item)
}



let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]  使用 union(_:)方法来创建一个包含两个合集所有值的新合集；

oddDigits.intersection(evenDigits).sorted()
// []  使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]  使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]  使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；


let houseAnimals: Set = ["?", "?"]
let farmAnimals: Set = ["?", "?", "?", "?", "?"]
let cityAnimals: Set = ["?", "?"]

houseAnimals.isSubset(of: farmAnimals)
// true 一个合集的所有值是被某合集包含
farmAnimals.isSuperset(of: houseAnimals)
// true 方法来确定一个合集是否包含某个合集的所有值；
farmAnimals.isDisjoint(with: cityAnimals)
// true  isStrictSubset(of:) 或者 isStrictSuperset(of:)方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；



//**************************字典******************************
// 创建字典
var dict = [Int: String]() // key int Value为string
dict[1] = "HI"
print(dict)

// 修改
let oldvalue = dict.updateValue("你好", forKey: 1) // 返回j旧值

let oldvalue1 = dict.updateValue("你好啊", forKey: 2) //没有旧值返回nil
// 遍历

for (key,Value) in dict {
    print("key====\(key)  \n value======\(Value)")
}
let keys =  dict.keys

