import SwiftUI

struct WelcomeView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    var body: some View {
        VStack {
            Text("Добро пожаловать в AffirmationApp!")
                .font(.largeTitle)
                .padding()
            
            Text("Аффирмации перед сном помогут вам улучшить свое психологическое состояние.")
                .padding()

            Button(action: {
                isFirstLaunch = false
            }) {
                Text("Начать")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
