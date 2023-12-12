import UIKit


/*
 - The Factory Method Pattern <...>
 • Kiểu đối tượng được tạo được xác định trong thời gian chạy.
 • Mẫu thiết kế này làm cho cơ sở mã linh hoạt hơn trong việc thêm hoặc loại bỏ các kiểu mới.
 */


protocol Fruit {
    func getPrice() -> String
    func getCount() -> Int
}

class Orange: Fruit {
    func getPrice() -> String {
        return "$5"
    }
    
    func getCount() -> Int {
        return 2
    }
}

class Banana: Fruit {
    func getPrice() -> String {
        return "$2"
    }
    
    func getCount() -> Int {
        return 5
    }
}

class Grapes: Fruit {
    func getPrice() -> String {
        return "$3.5"
    }
    
    func getCount() -> Int {
        return 1
    }
}

enum FruiType {
    case orange, banana, grapes
}

class FruitFactory {
    static func getFruit(type: FruiType) -> Fruit? {
        switch type {
        case .orange:
            return Orange()
        case .banana:
            return Banana()
        case .grapes:
            return Grapes()
        }
    }
}

// RUNNING
/// lấy đối tượng của lớp Orange từ lớp FruitFactory
let orange = FruitFactory.getFruit(type: .orange)
orange?.getPrice()
orange?.getCount()

/// lấy đối tượng của lớp Grapes từ lớp FruitFactory
let grapes = FruitFactory.getFruit(type: .grapes)
grapes?.getPrice() // "$3"
grapes?.getCount() // 1
