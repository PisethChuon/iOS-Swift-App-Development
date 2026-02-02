enum LoginStatus {
    case success
    case failed
}

let status = LoginStatus.success

switch status {
case .success:
    print("Login successful!")
case .failed:
    print("Login failed.")
}