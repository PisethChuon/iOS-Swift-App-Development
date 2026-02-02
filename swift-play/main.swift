enum LoginStatus {
    case success
    case failed
    case blocked
}

let status = LoginStatus.blocked

switch status {
case .success:
    print("Login successful!")
case .failed:
    print("Login failed.")
case .blocked:
    print("Account is blocked.")
}