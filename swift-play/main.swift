var favoriteFood: String? = "Pizza"
var petName: String? = nil

if let food = favoriteFood {
    print("Favorte food is \(food)")
}
else {
    print("Favorite food is unknown")
}

print("Pet name is \(petName ?? "unknown")")