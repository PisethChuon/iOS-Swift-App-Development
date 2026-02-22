struct Student {
    var score: Int
}

extension Student {
    var grade: String {
        switch score {
        case 90...100:
            return "A"
        case 80..<90:
            return "B"
        case 70..<80:
            return "C"
        case 60..<70:
            return "D"
        default:
            return "F"
        }
    }
}

let st1 = Student(score: 93)
print(st1.grade)