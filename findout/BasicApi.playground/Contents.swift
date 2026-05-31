import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

let json = """

{

    "id": 1,

    "name": "Leanne Graham",

    "email": "leanne@example.com"

}

""".data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(
        User.self,
        from: json
    )
    
    print(user.name)
} catch {
    print(error)
}
