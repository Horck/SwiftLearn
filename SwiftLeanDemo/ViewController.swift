//
//  ViewController.swift
//  SwiftLeanDemo
//
//  Created by 华融 on 2019/1/14.
//  Copyright © 2019年 Huarong Comsumer Finance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        unit4A = nil
        john = nil
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    
}

