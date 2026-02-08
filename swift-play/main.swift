class Car {
    var color: String
    var speed: Int

    init(color: String, speed: Int){
        self.color = color
        self.speed = speed
    }

    func drive() {
        print ("The \(color) car is driving at \(speed) km/h")
    }
}

let myCar = Car(color: "red", speed: 120)
let anotherCar = myCar
let anotherCar.color = "blue"
myCar.drive() // Output: The blue car is driving at 120 km/h