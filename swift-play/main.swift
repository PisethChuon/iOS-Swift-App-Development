struct User {
    let name: String
    var email: String
    var bio: String?

    // init(name: String, email: String) {
    //     self.name = name.uppercased()
    //     self.email = email
    // }

    func like(){

    }

    func comment(){
        print("comment was made")
    }
    
}

let pul = User(name: "Pulkit", email: "example.com")
pul.comment()

