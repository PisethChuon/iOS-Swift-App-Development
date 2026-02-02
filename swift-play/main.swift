enum LoginStatus: Int {
    case success = 200
    case failed = 401
    case blocked = 403
}

let status = LoginStatus.blocked

switch status {
case .success:
    print("Login successful!" + " " + "\(status.rawValue)")
case .failed:
    print("Login failed." + " " + "\(status.rawValue)")
case .blocked:
    print("Account is blocked." + " " + "\(status.rawValue)")
}