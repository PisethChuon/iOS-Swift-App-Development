var currentLevel: Int = 0, finalLevel: Int = 5
let gamCompleted = true

while currentLevel <= finalLevel {
    if gamCompleted {
        print("You have passed level \(currentLevel)")
        currentLevel += 1
    }
}
print("Congratulations! You have completed all levels.")