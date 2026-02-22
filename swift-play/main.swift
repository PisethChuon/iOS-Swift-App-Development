protocol Drivable {
    func startEngine()
    func stopEngine()
}

struct Car: Drivable {
    func startEngine() {
        print("Engine started")
    }

    func stopEngine() {
        print("Engine stopped")
    }
}
