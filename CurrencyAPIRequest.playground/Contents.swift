import UIKit

let baseURL = "https://openexchangerates.org/api/latest.json?app_id=a921f26b655c4b4597b4d60d4106ed50"

let url = URL(string: baseURL)!

let urlRequest = URLRequest(url: url)

print("FIRST")

func fetchRates() async {
    do {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        print("SECOND")
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return
        }
        
        print("--- SUCCESS ---")
        print(json)
        
    } catch {
        print(error.localizedDescription)
    }
    
    print("THIRD")
}

Task {
    await fetchRates()
}

//URLSession.shared.dataTask(with: urlRequest) { data, _, error in
//    if let error = error {
//        print(error.localizedDescription)
//        return
//    }
//    
//    guard let data else {
//        return
//    }
//    do {
//        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//            return
//        }
//        
//        print("--- SUCCESS ---")
//        print(json)
//        
//    } catch {
//        print(error.localizedDescription)
//    }
//    
//}
//.resume()
