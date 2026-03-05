let numbers = [10, 20, 19, 40, 50]

if let number = numbers.firstIndex(where: {$0 > 20}) {
    print(number)
}