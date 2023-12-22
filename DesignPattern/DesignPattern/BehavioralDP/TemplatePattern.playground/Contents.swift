import UIKit


/* - Template Pattern
 -> Trong mẫu này, lớp cơ sở xác định mẫu của thuật toán và để lớp con triển khai các phương thức trừu tượng này giống như cách chúng được định nghĩa trong lớp cơ sở mà không thay đổi cấu trúc tổng thể.
 */

protocol Office {
    func officeSchedule()
}

protocol Employee {
    func work()
    func getPaid()
}

class XYZOffice: Office {
    var delegate: Employee
    
    init(employee: Employee) {
        self.delegate = employee
    }
    
    func officeSchedule() {
        delegate.work()
        delegate.getPaid()
    }
}

class Developer: Employee {

    func work() {
        print("Developer has worked 40 hours/week this month")
    }

    func getPaid() {
        print("Developer has earned Rs 50,000 this month")
    }
}

class ProductManager: Employee {
    
    func work() {
        print("Product Manager has worked 55 hours/week this month")
    }
    
    func getPaid(){
        print("Product Manager has earned Rs 80,000 this month")
    }
}


//RUNNING...
let xyzOfficeDev = XYZOffice(employee: Developer())
let xyzOfficeManager = XYZOffice(employee: ProductManager())
xyzOfficeDev.officeSchedule()
xyzOfficeManager.officeSchedule()
