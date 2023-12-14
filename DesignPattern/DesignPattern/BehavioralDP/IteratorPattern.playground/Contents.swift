import UIKit


/*
 - Iterator Pattern
 -> Mẫu này được sử dụng để lặp qua một tập hợp các phần tử.
 -> Nó không hiển thị cấu trúc dữ liệu được sử dụng để triển khai nó (mảng, từ điển hoặc danh sách liên kết) thay vào đó nó cung cấp một giao diện lặp qua tập hợp các phần tử mà không hiển thị biểu diễn cơ bản của nó.
 */

/*
 - Sequence :
 -> Swift có giao thức Sequence tích hợp giúp tạo các trình vòng lặp.
 -> Giao thức Sequence cho phép truy cập tuần tự vào các phần tử của nó bằng cách tạo một trình vòng lặp.
 */
struct MyBestFilms: Sequence {
    let films: [String]
    
    func makeIterator() -> MyBestFilmsIterator {
        MyBestFilmsIterator(films)
    }
}

//IteratorProtocol là loại cung cấp các giá trị của một chuỗi tại một thời điểm.
struct MyBestFilmsIterator: IteratorProtocol {
    var films: [String]
    var cursor: Int = 0
    
    init(_ films: [String]) {
        self.films = films
    }
    
    mutating func next() -> String? {
        defer { cursor += 1}
        return films.count > cursor ? films[cursor] : nil
    }
}

/*
 - Lớp MyBestFilms triển khai giao thức Sequence để tạo một trình vòng lặp tùy chỉnh.
 - Mỗi khi hàm next() được gọi, nó sẽ trả về phần tử tiếp theo và lưu trữ chỉ mục hiện tại.
 */

/// MyFilms là mảng nha
let myFilms = MyBestFilms(films: ["A", "B", "C"])

for film in myFilms {
    print(film)
}
