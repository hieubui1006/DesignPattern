import UIKit


/* - Observer Pattern
 -> Trong mẫu này, một đối tượng thông báo cho các đối tượng khác về sự thay đổi trạng thái của nó, tức là khi trạng thái của một đối tượng thay đổi, đối tượng khác đã đăng ký với nó sẽ được thông báo về sự thay đổi trạng thái.

 -> Vì vậy, đó là mối quan hệ một-nhiều. Đối tượng có trạng thái thay đổi được gọi là có thể quan sát được hoặc chủ thể và các đối tượng đăng ký thay đổi trên đối tượng có thể quan sát được gọi là người quan sát.
 */


/*
 - add:     -> để thêm người quan sát
 - remove:  -> để loại bỏ người quan sát
 - notify:  -> để thông báo cho tất cả người quan sát về sự thay đổi trạng thái của nó
 */

protocol Observable {
    func add(customer: Observer)
    func remove(customer : Observer)
    func notify()
}

protocol Observer {
    var id: Int { get set }
    func update()
}

class AppleSeller: Observable {
    private var observers: [Observer] = []
    private var count: Int = 0
    
    var appleCount: Int {
        set {
            count = newValue
            notify()
        }
        get {
            return count
        }
    }
    
    func add(customer: Observer) {
        observers.append(customer)
    }
    
    func remove(customer: Observer) {
        observers = observers.filter { $0.id != customer.id }
    }
    
    func notify() {
        for item in observers {
            item.update()
        }
    }
    
}

class Customer: Observer {
    var id: Int
    var appleObservable: AppleSeller
    var name: String
    
    init(id: Int, appleObservable: AppleSeller, name: String) {
        self.id = id
        self.appleObservable = appleObservable
        self.name = name
        self.appleObservable.add(customer: self)
    }
    
    func update() {
        print("Hurry \(name)! \(appleObservable.appleCount) apples arrived at shop.")
    }
}

/*
 - AppleSeller là lớp triển khai giao thức Observable. Khi giá trị biến appleCount thay đổi, nó gọi phương thức notification() để thông báo cho khách hàng được thêm vào nó.
 - Khách hàng là lớp lắng nghe những thay đổi trong biến appleCount. Ngay khi giá trị của biến này thay đổi, khách hàng sẽ được cập nhật thông qua phương thức update().
 */

//RUNNING
let appleSeller = AppleSeller()

let aNme = Customer(id: 1, appleObservable: appleSeller, name: "a_Nme")
let bNme = Customer(id: 2, appleObservable: appleSeller, name: "b_Nme")

appleSeller.appleCount = 10
appleSeller.remove(customer: aNme)
appleSeller.appleCount = 20

