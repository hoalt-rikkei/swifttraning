//
//  ViewController.swift
//  TheFirst
//
//  Created by ios developer on 7/20/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

var str = "Hello World"
var arr = ["VinhDD", "ThangVD", "HoaLT", "HaND", "ThuyLT"]
var userDict:[String: Any] = [
    "name" : "HoaLT",
    "age" : 25,
    "address" : "Vietnam",
    "phonenum" : "0123456789"
]
var userDictArr = [userDict, userDict, userDict, userDict, userDict]

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doExcersise();
    }
    
    func doExcersise() {
        // 1.1
        print("\n1.1:")
        print(str)
        
        // 1.2
        print("\n1.2:")
        for i in 0 ..< 12 {
            for j in 0 ..< 15 {
                if (i == 0 || i == 11) || (j == 0 || j == 14) {
                    print("*", terminator:"")
                } else {
                    print(" ", terminator:"")
                }
            }
            print("")
        }
        
        // 1.3
        print("\n1.3:")
        print(arr)
        arr.insert("DatPT", at: 1)
        print(arr)
        
        // 1.4
        print("\n1.4:")
        print(userDict["name"]!)
        
        // 1.5
        print("\n1.5:")
        
        // change value
        userDictArr[1]["name"] = "Halo"
        userDictArr[1]["age"] = 15
        
        userDictArr[2]["name"] = "Mie"
        userDictArr[2]["age"] = 26
        
        userDictArr[3]["name"] = "Drav"
        userDictArr[3]["age"] = 10
        
        userDictArr[4]["name"] = "Clos"
        userDictArr[4]["age"] = 29
        
        userDictArr.sort(by: {
            let first = $0["age"] as! Int
            let second = $1["age"] as! Int
            return first < second
        })
        
        // print
        for x in 0 ..< userDictArr.count {
            print(userDictArr[x]["name"]!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

