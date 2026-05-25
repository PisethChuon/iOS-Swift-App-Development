import UIKit

let baseURL = "https://openexchangerates.org/api/latest.json?app_id=a921f26b655c4b4597b4d60d4106ed50"

let url = URL(string: baseURL)!

let urlRequest = URLRequest(url: url)

URLSession.shared.dataTask(with: urlRequest) { data, _, error in
    if let error = error {
        print(error.localizedDescription)
        return
    }
    
    guard let data else {
        return
    }
    do {
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return
        }
        
        print("--- SUCCESS ---")
        print(json)
        
    } catch {
        print(error.localizedDescription)
    }
    
}
.resume()
