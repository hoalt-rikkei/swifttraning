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
//* Lưu ý: Trong trường hợp khai báo ngoài class như trên thì toàn bộ nơi khác nằm ngoài class đều có thể truy xuất được các biến này
//         => Giải pháp: Nếu không cần thiết thì nên khai báo bên trong class

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doExcersise(); //* Lưu ý: Không cần dấu ; khi kết thúc một câu trong swift
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
        //* Lưu ý: Những phần đề bài yêu cầu khai báo thì nên khai báo biến ở trong này
        print("\n1.3:")
        print(arr)
        arr.insert("DatPT", at: 1)
        print(arr)
        
        // 1.4
        //* Lưu ý: Những phần đề bài yêu cầu khai báo thì nên khai báo biến ở trong này
        print("\n1.4:")
        print(userDict["name"]!)
        
        // 1.5
        //* Lưu ý: Những phần đề bài yêu cầu khai báo thì nên khai báo biến ở trong này
        print("\n1.5:")
        
        // change value
        //* Gợi ý: Vì đều là các action lặp lại, nên thử sử dụng hàm để code ngắn gọn hơn :D
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
        //* Lưu ý: Bổ sung thêm cách thức kiểm tra và ép kiểu các đối tượng:
        //         - Vì value của key 'age' trong dictionary là kiểu Any, nên khi muốn lấy giá trị Int của nó ra mà ta ép nó bằng cách dùng ! (kiểu non optional) sẽ rất nguy hiểm (vì value có thể rơi vào kiểu khác, mà ép nó về Int trong nhiều trường hợp sẽ dẫn đến lỗi)
        //         => Giải pháp: Ta có thể dùng phương thức if let kết hợp với ? (optional), khi dùng optional swift sẽ hiểu biến đó có thể chứa giá trị hoặc không.
        //                       if let value1 = value2 { ... } sẽ đảm bảo rằng nếu value2 có giá trị thì nó sẽ được gán vào value1, ngược lại nếu không có thì bỏ qua if này.
        //         => Áp dụng vào đoạn code mới bên dưới:
       
        userDictArr.sort(by: {
            //Bằng cách này, ta có thể đảm bảo chỉ khi giá trị trước ($0) và sau ($1) đều có kiểu Int thì mới so sánh, không thì thôi
            if let first = $0["age"] as? Int, let second = $1["age"] as? Int {
                return first < second
            }
            return false
        })
        
        //* Yêu cầu: Tìm hiểu thêm về 2 kiểu Optional và Non optional: https://stackoverflow.com/questions/24003642/what-is-an-optional-value-in-swift
        
        
        // print
        for x in 0 ..< userDictArr.count {
            //* Lưu ý: Áp dụng cách check if let để check nếu có tên thì mới print ra, tránh việc crash app. 
            //         => Tham khảo đoạn code bên dưới:
            
            //  if let name = userDictArr[x]["name"] as? String {
            //      print(name)
            //  }
            print(userDictArr[x]["name"]!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

