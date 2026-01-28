var email: String?
var password: String?

email = "test@example.com"
password = nil

if let _ = email, let _ = password {
    print ("Login success")
}
else {
    print ("Email or Password is missing")
}