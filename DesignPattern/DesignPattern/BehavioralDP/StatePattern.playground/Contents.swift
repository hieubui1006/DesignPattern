import UIKit


/* - State Pattern
 -> Mẫu thiết kế trạng thái là mẫu thiết kế trong đó một đối tượng cần thay đổi hành vi của mình khi trạng thái bên trong của nó thay đổi.
 -> Có vẻ như đối tượng đã thay đổi lớp của nó.
 */

protocol Human {
    func getState() -> ManState
    func set(state: ManState)
}

protocol ManState {
    func stand()
    func walk()
    func run()
    
    func toString() -> String
}

extension ManState {
    func stand() { }
    func walk() { }
    func run() { }
}

class Man: Human {
    
    var state: ManState?
    
    init() {
        state = nil
    }
    
    func set(state: ManState) {
        self.state = state
    }
    
    func getState() -> ManState {
        return state!
    }
}

class StandingState: ManState {
  
    var human: Human
    init(_ human: Human) {
        self.human = human
    }
    
    func stand() {
        print("The man is in standing position")
        human.set(state: self)
    }
    
    func toString() -> String {
        return "Standing State"
    }
}

class WalkingState: ManState {
    
    var human: Human
    init(_ human: Human) {
        self.human = human
    }
    
    func walk() {
        print("The man is in walking position")
        human.set(state: self)
    }
    
    func toString() -> String {
        return "Walking State"
    }
}

class RunningState: ManState {
    
    var human: Human
    init(_ human: Human) {
        self.human = human
    }
    
    func run() {
        print("The man is in running position")
        human.set(state: self)
    }
    
    func toString() -> String {
        return "Running State"
    }
}

/*
 - Đầu tiên, chúng ta xác định một giao thức có tên Human, có một getter để lấy trạng thái hiện tại và một setter để thiết lập trạng thái hiện tại của đối tượng.
 - Trạng thái sẽ được thực hiện bởi một lớp có tên là Man.
 - Giao thức ManState có ba trạng thái: stand(), walk() và run(). Nó được triển khai bởi ba lớp cụ thể: StandingState, WalkingState và RunningState.
 */

//RUNNING...
let man = Man()

let walkingState = WalkingState(man)
walkingState.walk()
print(man.getState().toString())

let runningState = RunningState(man)
runningState.run()
print(man.getState().toString())






