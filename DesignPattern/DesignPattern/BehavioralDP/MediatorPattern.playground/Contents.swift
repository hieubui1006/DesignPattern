import UIKit


/*  - Mediator Pattern :
 -> Chúng ta hãy lấy một tình huống khi hai hoặc nhiều lớp phải tương tác với nhau.
 -> Thay vì trao đổi trực tiếp với nhau và tìm hiểu cách thực hiện, họ có thể nói chuyện thông qua Mediator.
 */

protocol Receiver {
    var name: String { get }
    func receive(message: String)
}

protocol Sender {
    var teams: [Receiver] { get set }
    func send(message: String, sender: Receiver)
}

class Mediator: Sender {
    var teams: [Receiver] = []
    
    func register(candidate: Receiver) {
        teams.append(candidate)
    }
    
    func send(message: String, sender: Receiver) {
        for team in teams {
            if team.name != sender.name {
                team.receive(message: message)
            }
        }
    }
}

/// Các team người nhận
struct TeamA : Receiver {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received::: \(message)")
    }
}

struct TeamB: Receiver {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received == \(message)")
    }
    
    
    func test() {
        var sss: String = "fdsfdsafdsfdsfdsaf"
        var mulStr = NSMutableString(string: sss)
        var data = Data()
        
        for i in 0..<mulStr.length {
            let value = mulStr.substring(with: NSRange(location: i, length: 1))
            print("==\(mulStr.substring(with: NSRange(location: i, length: 1)))")

            let point = UnsafeMutablePointer<String>.allocate(capacity: 1)
            point.initialize(to: value)
            let bufferPointer = UnsafeBufferPointer(start: point, count: 1)
            data.append(bufferPointer)
        }
        print("====\(data.count)")
    }
}

/*
 - Protocol Receiver: được thực hiện bởi các Nhóm có bản tóm tắt receive phương thức lấy thông điệp làm tham số.
 - Protocol Sender: được thực hiện bởi mediator có phương thức trừu tượng send lấy thông báo và đối tượng loại Người nhận(Receive Type) làm tham số.
 -> Our mediator  lặp lại qua từng nhóm trong danh sách các nhóm của nhóm đó. Nếu đội A gửi yêu cầu thì đội B sẽ nhận được yêu cầu và ngược lại.
 */

/// -> Lưu ý rằng các đội không nhận thức được nhau. Không có sự tham khảo nào về đội A ở đội B và đội B ở đội A.
/// Note: NSNotificationCenter sử dụng Mediator Pattern

//RUNNING
let mediator = Mediator()
let teamA = TeamA(name: "The Avengers")
let teamB = TeamB(name: "The League of Extraodinary Gentlement")
teamB.test()
mediator.register(candidate: teamA)
mediator.register(candidate: teamB)

mediator.send(message: "Select for final ::: from \(teamA.name)", sender: teamA)
mediator.send(message: "Select for final == from \(teamB.name)", sender: teamB)



