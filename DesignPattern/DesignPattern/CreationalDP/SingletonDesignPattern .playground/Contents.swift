import UIKit

var greeting = "Hello, playground"

/*
 - Singleton Design Pattern <...>
 - Trong Swift chúng ta định nghĩa các lớp Singleton bằng cách sử dụng từ khóa static. Nó có nghĩa là đối tượng sẽ chỉ được khởi tạo một lần.
 - Chỉ có một bản sao của đối tượng này và được sử dụng bởi các đối tượng khác trên toàn cầu.
 */

// Shared url session
let urlSession = URLSession.shared
// user defaults
let userDefaults = UserDefaults.standard


// Singleton class Vehicle
class Vehicle {
    static let sharedInstance = Vehicle()
    // private initialser
    private init() {}
    
    func getName() -> String {
        return "Car"
    }
}

//RUNNING
Vehicle.sharedInstance.getName() // "Car"

