import Foundation

struct User: Codable {
    let id: Int
    let name: String
}

let json = """

[
  {
    "id": 1,
    "name": "Leanne"
  },
  {
    "id": 2,
    "name": "Ervin"
  }
]

""".data(using: .utf8)!

do {
    let users = try JSONDecoder().decode(
        [User].self,
        from: json
    )
    
    if let firstuser = users.first {
        print(firstuser.name)
    }
    
} catch {
    print(error)
}
