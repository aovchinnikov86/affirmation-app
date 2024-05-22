import SwiftUI

struct MainView: View {
    @State private var affirmationProgress = 0.0
    @AppStorage("currentDay") var currentDay: Int = 1
    @AppStorage("currentStep") var currentStep: Int = 1
    @State private var showAffirmation = false
    @State private var isQueenAffirmation = false
    
    var body: some View {
        ZStack {
            Image("MV_background") // имя изображения, добавленного в Assets.xcassets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                
                ForEach((0..<affirmationSteps.count).reversed(), id: \.self) { index in
                    let textColor: Color = {
                        if index + 1 > currentStep {
                            return config.disableColor
                        }
                        if index + 1 == currentStep {
                            return config.currentColor
                        }
                        return config.enableColor
                    }()
                    let opacity = index + 1 <= currentStep ? 1.0 : 0.5
                    
                    ZStack {
                        Image(affirmationSteps[index].image)
                            .shadow(radius: 5)
                        
                        Text(affirmationSteps[index].affirmation.name)
                            .font(affirmationSteps[index].font)
                            .foregroundColor(textColor)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                            .shadow(color: .black, radius: 3, x: -1, y: -1)
                            .shadow(color: .black, radius: 3, x: 1, y: -1)
                            .shadow(color: .black, radius: 3, x: -1, y: 1)
                    }
                    .padding(-3)
                    .opacity(opacity)
                }
                
                ProgressView(value: Double(currentDay), total: Double(affirmationRepeatCount))
                    .padding()
                    .accentColor(.purple)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Button(action: {
                    showAffirmation = true
                }) {
                    Image("MV_play_button") // имя изображения кнопки, добавленного в Assets.xcassets
                        .resizable()
                        .frame(width: 104, height: 80)
                        .shadow(radius: 5)
                }
                .padding([.bottom, .trailing], 10)
                .fullScreenCover(isPresented: $showAffirmation) {
                    if currentDay == affirmationRepeatCount && currentStep == affirmationSteps.count + 1 {
                        AffirmationView(affirmation: affirmationQueen)
                    } else {
                        AffirmationView(affirmation: affirmationSteps[currentStep - 1].affirmation)
                    }
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
