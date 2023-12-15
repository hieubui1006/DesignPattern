import UIKit

/* - Memento Pattern:
 -> Ghi lại trạng thái hiện tại của một đối tượng và lưu trữ nó theo cách mà bạn có thể truy xuất nó sau này khi bạn muốn quay lại trạng thái trước đó.
 */

/*
 - save      -> lưu thuộc tính `state` bằng khóa trong UserDefaults.
 - retrieve  -> khôi phục thuộc tính `state` bằng cách sử dụng khóa từ UserDefaults.
 - state     -> thuộc loại từ điển lưu trữ giá trị bằng một khóa duy nhất.
 - key       -> được sử dụng để lấy giá trị tương ứng từ trạng thái.
 */


typealias MementoType = [String: Any]

protocol Memento: AnyObject {
    var key: String { get set }
    var state: MementoType { get set }
    
    func save()
    func retrieve()
}

extension Memento {
    func save() {
        UserDefaults.standard.set(state, forKey: key)
    }
    
    func retrieve() {
        state = UserDefaults.standard.object(forKey: key) as? MementoType ?? MementoType()
    }
}

class Profile: Memento {
    var key: String
    var state: MementoType
    
    var name: String
    var age: Int
    
    init(name: String, age: Int, key: String) {
        self.name = name
        self.age  = age
        self.key  = key
        self.state = MementoType()
    }
    
    func saveDetail() {
        state["name"] = name
        state["age"] = age
        save()
    }
    
    init(key: String) {
        self.key = key
        
        self.state = MementoType()
        self.name  = ""
        self.age   = 0
    }
    
    func retrieveDetails() -> MementoType {
        retrieve()
        return state
    }
}


/*
 Class Profile sẽ triển khai Memento protocol. Bằng cách triển khai giao thức này, chúng ta có thể lưu toàn bộ lớp vào bộ lưu trữ liên tục và sau đó truy xuất trạng thái sau đó.
 */

//RUNNING
var profile = Profile(name: "A", age: 30, key: "a_profile")
profile.saveDetail()

profile = Profile(name: "B", age: 20, key: "b_profile")
profile.saveDetail()

/// Đọc dữ liệu từ key a_profile
let profileDetails = Profile(key: "a_profile")
let profileState = profileDetails.retrieveDetails()

print(profileState)

