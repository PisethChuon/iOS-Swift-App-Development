enum AppState: Equatable {
    case loading
    case success(message: String)
}

let appState1 = AppState.success(message: "Done")
let appState2 = AppState.success(message: "Done")

print(appState1 == appState2)