struct Person {
    var name: String
}

extension Person: CustomStringConvertible {
    var description: String {
        return "Person name: \(name)"
    }   
}

let person = Person(name: "Alice")
print(person.description) // Output: Person(name: Alice)