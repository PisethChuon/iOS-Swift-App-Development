struct User: Hashable {
    var name: String
    var age: Int
}

let u1 = User(name: "Piseth", age: 22)
let u2 = User(name: "Piseth", age: 22)

var users: Set<User> = []
users.insert(u1)