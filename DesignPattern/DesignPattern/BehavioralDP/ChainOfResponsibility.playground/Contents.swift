import UIKit


/* Chain of Responsibility
  - Là một mẫu thiết kế hành vi cho phép chúng tôi chuyển các yêu cầu giữa một chuỗi các trình xử lý trong đó mỗi trình xử lý quyết định xử lý yêu cầu hoặc chuyển nó dọc theo chuỗi.
 */


enum Level: Int {
    case state = 1
    case national = 2
    case international = 3
}

class Sports {
    var level: Level
    
    init(level: Level) {
        self.level = level
    }
}

protocol GameManagement {
    var nextLevelManagement: GameManagement? { get set }
    func manage(sports: Sports)
}

class StateSportsTeam: GameManagement {
    var nextLevelManagement: GameManagement?
    
    func manage(sports: Sports) {
        if sports.level == .state {
            print("Managed by State Sports Management")
        } else {
            nextLevelManagement?.manage(sports: sports)
        }
    }
}

class NationalSportsTeam: GameManagement {
    var nextLevelManagement: GameManagement?
    
    func manage(sports: Sports) {
        if sports.level == .national {
            print("Managed by National Sports Management")
        } else {
            nextLevelManagement?.manage(sports: sports)
        }
    }
}

class InternationalSportsTeam: GameManagement {
    var nextLevelManagement: GameManagement?
    
    func manage(sports: Sports) {
        if sports.level == .international {
            print("Managed by International Sports Management")
        } else {
            nextLevelManagement?.manage(sports: sports)
        }
    }
}

// RUNNING
/*
 - Sau đó, chúng ta có giao thức có tên GameManagement có thể chuyển trách nhiệm dọc theo chuỗi xử lý.
 - Các lớp StateSportsTeam, NationalSportsTeam & InternationalSportsTeam thực hiện giao thức này.
 - Nếu cấp độ thể thao không thuộc quyền quản lý của họ, họ sẽ chuyển trách nhiệm cho cấp quản lý cấp cao hơn (hoặc chuỗi xử lý).
 */
let stateSportsTeam = StateSportsTeam()
let nationalSportsTeam = NationalSportsTeam()
let internationalSportsTeam = InternationalSportsTeam()

stateSportsTeam.nextLevelManagement = nationalSportsTeam
nationalSportsTeam.nextLevelManagement = internationalSportsTeam

let sports1 = Sports(level: .international)
stateSportsTeam.manage(sports: sports1)

let sports2 = Sports(level: .national)
stateSportsTeam.manage(sports: sports2)

let sports3 = Sports(level: .state)
stateSportsTeam.manage(sports: sports3)




