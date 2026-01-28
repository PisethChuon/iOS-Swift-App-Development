var username: String?
var age: Int?

username = nil
age = 21

print("Default username: \(username ?? "unknown user")")

if let userAge = age {
    print ("Age: \(userAge)")
}
else { 
    print("Age not provided")
}