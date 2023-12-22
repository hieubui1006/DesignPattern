import UIKit


class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var s_merge = [s+t]
        var countItem = 0
        var arrIndexes = [Int]()
        for i in 0..<s_merge.count {
            guard !arrIndexes.contains(i) else { continue }
            for j in i+1..<s_merge.count {
                guard !arrIndexes.contains(j) else { continue }
                if s_merge[i] == s_merge[j] {
                    arrIndexes.append(j)
                    countItem += 1
                    break
                }
            }
        }
        let s_mergeCount = s_merge.count
        print(s_mergeCount)
        let itemCount = countItem * 2
        print(itemCount)
        return s_mergeCount == itemCount
    }
}
let sol = Solution().isAnagram("anagram", "nagaram")


/* - Visitor Pattern
  -> Mẫu thiết kế của khách truy cập tách các thuật toán khỏi các đối tượng mà chúng vận hành, tức là logic vận hành được chuyển từ từng thành phần của một nhóm sang một lớp mới.
  -> Lớp mới sẽ thực hiện logic hoạt động bằng cách sử dụng dữ liệu từ các phần tử đó.
  -> Mỗi phần tử chấp nhận một khách truy cập thực hiện logic trong một lớp khác. Vì vậy cấu trúc của lớp được truy cập không hề thay đổi.
 */

protocol Country {
    func accept(visitor: CountryVisitor)
}

protocol CountryVisitor {
    func visit(country: India)
    func visit(country: Brazil)
    func visit(country: China)
}

class India: Country {
    func accept(visitor: CountryVisitor) {
        visitor.visit(country: self)
    }
}

class Brazil: Country {
    func accept(visitor: CountryVisitor) {
        visitor.visit(country: self)
    }
}

class China: Country {
    func accept(visitor: CountryVisitor) {
        visitor.visit(country: self)
    }
}

class CountryVisitorName: CountryVisitor {
    var visitorName = ""
    
    func visit(country: India) {
        visitorName = "Chen"
    }
    
    func visit(country: Brazil) {
         visitorName = "Ramesh"
    }
    
    func visit(country: China) {
         visitorName = "Antonio"
    }
}

let countries: [Country] = [India(), Brazil(), China()]
let names = countries.map { (country: Country) -> String in
    let visitor = CountryVisitorName()
    country.accept(visitor: visitor)
    return visitor.visitorName
}
print(names)
