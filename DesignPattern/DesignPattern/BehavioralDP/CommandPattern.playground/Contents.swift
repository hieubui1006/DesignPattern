import UIKit

/* Command Pattern
 - Trong mẫu Lệnh, lớp thực thi lệnh (được gọi là Invoker) được tách rời khỏi lớp tạo ra lệnh (ConcreteCommand) và lớp biết cách thực hiện lệnh đó (Receiver).
 */


protocol Command {
    func excute()
}

class ConcreteCommand: Command {
    var colorReceiver: ColorReceiver
    
    init(colorReceiver: ColorReceiver) {
        self.colorReceiver = colorReceiver
    }
    
    func excute() {
        colorReceiver.changeColor()
    }
}

class Invoker {
    func excute(command: Command) {
        command.excute()
    }
}

class ColorReceiver {
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func changeColor() {
        print(color.name)
    }
}

struct Color {
    var name: String
}

class Client {
    let invoker = Invoker()
    
    func showPattern() {
        let colorReceiver = ColorReceiver(color: Color(name: "red"))
        let command: Command = ConcreteCommand(colorReceiver: colorReceiver)
        invoker.excute(command: command)
    }
}

let client = Client()
client.showPattern()
