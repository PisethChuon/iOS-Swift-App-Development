import Foundation

struct User: Codable {
    let userId: Int
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case fullName = "full_name"
    }
}

let data = """

{
  "user_id": 1,
  "full_name": "Piseth"
}

""".data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(
        User.self,
        from: data
    )
    
    print(user.fullName)
} catch {
    print(error)
}
