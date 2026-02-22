extension String {
    func greet() -> String {
        return "Hello, \(self)! Welcome to Swift \(self)"
    }
}

let name = "Alice"
print(name.greet())