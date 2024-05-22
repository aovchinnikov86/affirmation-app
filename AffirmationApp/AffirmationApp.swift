import SwiftUI

@main
struct AffirmationApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                WelcomeView()
            } else {
                MainView()
            }
        }
    }
}
