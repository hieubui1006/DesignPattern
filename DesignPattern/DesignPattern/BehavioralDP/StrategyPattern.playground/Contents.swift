import UIKit


/* - Strategy Pattern
 -> Mẫu này xác định một nhóm thuật toán, mỗi thuật toán được viết trong một lớp riêng biệt cho phép chúng ta chọn thuật toán nào sẽ thực thi trong thời gian chạy.
 -> Chúng tôi xác định một giao thức có tên là Strategy và nó có một phương thức có tên là convert để chuyển đổi số thành định dạng do người dùng quyết định khi chạy.
 */

// Chúng tôi triển khai hai thuật toán: BinaryStrategy để chuyển đổi số thành nhị phân và HexStrategy để chuyển đổi số thành hex.
protocol Strategy {
    func convert(number: Int)
}

class Convert {
    var strategy: Strategy
    var number: Int
    
    init(number: Int, strategy: Strategy) {
        self.number = number
        self.strategy = strategy
    }
    
    func update() {
        self.strategy.convert(number: number)
    }
}

class BinaryStrategy: Strategy {
    func convert(number: Int) {
        let binary = String(number, radix: 2)
        print("Binary is \(binary)")
    }
}

class HexStrategy: Strategy {
    func convert(number: Int) {
        let hex = String(number, radix: 16)
        print("Hex is \(hex)")
    }
}

/*
 - Lớp Convert có một thuộc tính được gọi là Strategy nên bất kỳ lớp nào cũng có thể được sử dụng để triển khai giao thức Strategy.
 - Trong thời gian chạy, chúng tôi chuyển thể hiện của lớp thuộc loại Strategy tùy thuộc vào việc chúng tôi chọn thuật toán thực hiện chuyển đổi số nhị phân hoặc chúng tôi chọn thuật toán thực hiện chuyển đổi số hex.
 */

//RUNNING...
let binaryConvert = Convert(number: 2, strategy: BinaryStrategy())
binaryConvert.update()

let hexConvert = Convert(number: 123, strategy: HexStrategy())
hexConvert.update()
