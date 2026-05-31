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
