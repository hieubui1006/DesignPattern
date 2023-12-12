import UIKit

var greeting = "Hello, playground"

/*
 • Sử dụng mẫu Builder khi xây dựng API công khai vì nó không tiết lộ chi tiết triển khai
 • Che giấu sự phức tạp. Nó cung cấp một API đơn giản đằng sau một nhiệm vụ phức tạp.
 */

protocol ShoesShop {
    func produceShoes()
}

class Nike: ShoesShop {
    func produceShoes() {
        print(" Nike Shoes")
    }
}

class Director {
    let shoes: ShoesShop
    
    init(shoesShop: ShoesShop) {
        self.shoes = shoesShop
    }
    
    func produce() {
        shoes.produceShoes()
    }
}

//RUNNING
let nike = Nike()

/// khởi tạo Director với đối tượng nike
let director = Director(shoesShop: nike)

/// gói gọn quá trình sản xuất sản phẩm nike
director.produce() // "Nike Shoes"
