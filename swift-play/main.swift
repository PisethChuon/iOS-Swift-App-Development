extension String {
    func shout() -> String {
        self.uppercased() + "!"
    }
}

protocol Drivable {
    func drive()
}

struct User: Enquatable {
    var name = String
}