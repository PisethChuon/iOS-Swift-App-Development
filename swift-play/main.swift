var age = 42

func voteEligibility(){
    guard age >= 18 else {
    print("Access denied - You must be at least 18 years old.")
    return
}

print("Access granted - You are old enough!")
}
voteEligibility()

