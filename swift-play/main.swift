struct User {
    let name: String
    var email: String
    var bio: String?

    init(name: String, email: String) {
        self.name = name.uppercased()
        self.email = email
    }

    func like(){

    }

    func comment(){

    }
    
}

let pul = User(name: "Pul", email: "example.com")
print(pul)
