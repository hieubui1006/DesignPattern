import UIKit

/*
 - The Prototype Pattern <Nguyên mẫu>
 -> Kiểu mẫu thiết kế này được sử dụng để khởi tạo một đối tượng mới bằng cách sao chép một đối tượng hiện có được gọi là nguyên mẫu.
 */

protocol Fruit {
    func set(price: String?)
    func clone() -> Fruit
}

class Apple: Fruit {
    
    var count: Int
    var price: String?
    
    init(count: Int) {
        self.count = count
    }
    
    func set(price: String?) {
        self.price = price
    }
    
    func clone() -> Fruit {
        return Apple(count: self.count)
    }
}
/// Tạo 1 prototype
let prototype = Apple(count: 4)

/// Sao chép 1 object đã tồn tại
let redApple: Apple = prototype.clone() as! Apple
redApple.count // 4

/// thêm thuộc tính riêng
redApple.set(price: "$2")
redApple.price // $2

/// Tạo một bản sao của đối tượng hiện có
let greenApple: Apple = prototype.clone() as! Apple
greenApple.count // 4

/// thêm thuộc tính riêng
greenApple.set(price: "$4")
greenApple.price // $4
